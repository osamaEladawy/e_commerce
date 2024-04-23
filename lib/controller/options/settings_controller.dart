import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:e_commerce_app/core/services/my_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/functions/handleStatus_response.dart';
import '../../data/data_source/data_remote/cart_data.dart';
import '../../data/data_source/data_remote/myfavourite_data.dart';
import '../../data/model/cart_model.dart';
import '../../data/model/myfavourite_modek.dart';

abstract class SettingController extends GetxController{
  logOut();
  goToAddress();
  goToPending();
  goToArchive();
  changeSwitch(bool val);
  changeNotification(bool val);
  goToProfile();
  logOutGoogle();
  goToFavouritePage();
  goToCartPage();
  getData();
  viewCart();


}

class SettingControllerImp extends SettingController{
  MyServices services = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Curd curd = Get.find();


  MyFavoriteData myFavorite = MyFavoriteData(curd: Get.find());

  List<MyFavouriteModel> data = [];
  CartData cartData = CartData(curd: Get.find());
  List<CartModel>dataCart = [];



  bool value = false;
  bool notification = false ;
  late String userid ;
  late String userPic ;
  late String userEmail ;
  late String userPhone ;
  late String userName;
  int itemsCountInFav = 0;
  int itemsCountInCart = 0 ;

  @override 
  logOut() {
    String userid =services.preferences!.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    logOutGoogle();
    services.preferences!.clear();
    Get.offAllNamed(AppRoutes.login);
  }

    @override
   logOutGoogle() async{
   await curd.logOutFromGoogle();
  }


  @override
  goToAddress() {
 Get.toNamed(AppRoutes.viewAddress);
  }

  @override
  changeSwitch(val) {
   value = val;
   update();
  }

  @override
  goToArchive() {
   Get.toNamed(AppRoutes.archiveOrders);
  }

  @override
  goToPending() {
    Get.toNamed(AppRoutes.pendingOrders);
  }

  @override
  changeNotification(bool val) {
  if(notification=val == true){
    FirebaseMessaging.instance.subscribeToTopic("users");
    FirebaseMessaging.instance.subscribeToTopic("users$userid");
  }else{
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
  }
  update();
  }

  @override
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response =
    await myFavorite.myFavoriteData(services.preferences!.getString("id")!);
    //check for data, it is map || status request,
    statusRequest = handleStatus(response);
    if (StatusRequest.success == statusRequest) {
      //check for operation is successful,
      if (response["status"] == "success") {
        List dataService = response['data'];
        data.addAll(dataService.map((e) => MyFavouriteModel.fromJson(e)));
        itemsCountInFav = data.length;
        print("data===========================myFavourite");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  viewCart()async {
    statusRequest= StatusRequest.loading;
    update();
    var response = await cartData.viewCart(
        services.preferences!.getString("id")!);
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success"){
        List responseData = response["datacart"];
        dataCart.addAll(responseData.map((e) => CartModel.fromJson(e)));
        itemsCountInCart = dataCart.length;

      }else{
        statusRequest =StatusRequest.failure;
      }
    }

    update();

  }


  @override
  void onInit() {
    userid =  services.preferences!.getString("id")!;
    userPic =  services.preferences!.getString("image")!;
    userEmail =  services.preferences!.getString("email")!;
    userPhone =  services.preferences!.getString("phone")!;
    userName =  services.preferences!.getString("username")!;
    getData();
    viewCart();
    super.onInit();
  }
  
  @override
  goToProfile() {
    Get.toNamed(AppRoutes.profile,arguments: {
      "userid" :userid,
      "userPic" :userPic,
      "userEmail" :userEmail,
      "userPhone" :userPhone,
      "userName" :userName,
    });
  }

  @override
  goToCartPage() {
    Get.toNamed(AppRoutes.cart);
  }

  @override
  goToFavouritePage() {
    Get.toNamed(AppRoutes.myFavourite);

  }

}