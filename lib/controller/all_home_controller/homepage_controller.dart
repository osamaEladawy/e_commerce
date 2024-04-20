import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:e_commerce_app/core/services/my_services.dart';
import 'package:e_commerce_app/data/data_source/data_remote/home_data.dart';
import 'package:e_commerce_app/data/model/items_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/functions/handleStatus_response.dart';

abstract class HomePageController extends GetxController{
  initialData();
  getAllData();
  goToLogin();
  goToItems(List categories,int selectedCat,int categoryid);
  gotoProductDetails(ItemsModel productDetails);

 goToDetailsProduct(ItemsModel itemsModel);
 offers();

  goToFavourite();
  checkSearch(String value);
  search();
  listOfProducts();

  notification();
}

class HomePageControllerImp extends HomePageController{
 late TextEditingController product;
 

  MyServices services = Get.find();

  String device = Get.deviceLocale!.languageCode;

  GlobalKey<FormState>formState = GlobalKey<FormState>();

  String? lang ;

  HomaPageData homaPageData = HomaPageData(curd: Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  List categories = [];
  List items = [];
  List settings = [];
  List data = [];
  List<ItemsModel> listOfModel = [];

  String? username;
  String? userid;
  String title = "";
  String body = "";
  String deliveryTime = "";
  late TextEditingController controller;
  bool isSearch = false;


 @override
 void onInit() {
   FirebaseMessaging.instance.subscribeToTopic("users");
   initialData();
   super.onInit();
 }


 @override
  initialData(){
    username =  services.preferences!.getString('username');
    userid =  services.preferences!.getString('id');
    getAllData();
     offers();
    product = TextEditingController();
    lang = services.preferences!.getString('lang');
    controller = TextEditingController();
  }


  @override
  offers() async{
    statusRequest = StatusRequest.loading;
    //update();
    var response = await homaPageData.myOffers();
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response["status"] == "success"){
        List lists = response["data"];
        data.addAll(lists.map((e) => ItemsModel.fromJson(e),),);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }



  @override
  getAllData() async{
    statusRequest = StatusRequest.loading;
    update();
    var response= await homaPageData.getData();
    print("response controller....................................$response");
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response["status"] == "success"){
       categories.addAll(response["categories"]);
       items.addAll(response["items"]);
       settings.addAll(response["settings"]);
       title = settings[0]["settings_title"];
       body = settings[0]["settings_body"];
       deliveryTime = settings[0]["settings_deliverytime"].toString();

       services.preferences!.setString("deliverytime", deliveryTime);

      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }




 @override
 void dispose() {
   controller.dispose();
   product.dispose();
   super.dispose();
 }

  @override
  goToLogin() {
   Get.offNamed(AppRoutes.login);
   services.preferences!.clear();
   update();
  }

  @override
  goToItems(categories,selectedCat,categoryId) {
   Get.toNamed(AppRoutes.items,arguments: {
     "categories":categories,
     "selectedcat":selectedCat,
     "categoryid":categoryId,
   });
  }

  @override
  goToFavourite() {
    Get.toNamed(AppRoutes.myFavourite);
  }

  @override
  checkSearch(value) {
   if(value.isEmpty){
     statusRequest = StatusRequest.none;
     isSearch = false;
   }
   update();
  }

  @override
  search() {
    if(formState.currentState!.validate()){
      isSearch = true;
      listOfProducts();
    }else{
      print("not valid");
    }
  update();
  }

  @override
  listOfProducts() async{
    statusRequest = StatusRequest.loading;
    update();
    var response= await homaPageData.searchForData(controller.text);
    print("response controller....................................$response");
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response["status"] == "success"){
        listOfModel.clear();
       List data = response['data'];
       listOfModel.addAll(data.map((e) => ItemsModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

 @override
 gotoProductDetails(productDetails) {
   Get.toNamed(AppRoutes.productDetiales,arguments: {
     "productdetails" : productDetails,
   });
 }

  @override
  goToDetailsProduct(itemsModel) {
   Get.toNamed(AppRoutes.detialesOrders,arguments: {
     "itemsModel" : itemsModel,
   });
  }
  
  @override
  notification() {
   Get.toNamed(AppRoutes.notification);
  }





}