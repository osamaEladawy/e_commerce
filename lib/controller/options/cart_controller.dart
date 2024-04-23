
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:e_commerce_app/core/functions/handleStatus_response.dart';
import 'package:e_commerce_app/core/services/my_services.dart';
import 'package:e_commerce_app/data/data_source/data_remote/cart_data.dart';
import 'package:e_commerce_app/data/model/cart_model.dart';
import 'package:e_commerce_app/data/model/copon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController{
  addCart(int itemId);
  removeCart(int itemId);
  getCountItems(int itemId);
  viewCart();
  coupon();
  back();
  getTotalPrice();
  goToCheckOut();
}

class CartControllerImp extends CartController{
  CartData cartData = CartData(curd: Get.find());
  MyServices services  = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  List<CartModel>dataCart = [];
  late CartModel cartModel;
  List<CoponModel> coupons=[];

  int responseCount = 0;
  double responsePrice = 0.0 ;

  late TextEditingController nameCoupon;
  GlobalKey<FormState>formState = GlobalKey<FormState>();
   CoponModel? couponModel;
  int? couponDiscount = 0 ;
  String? couponNamed ;
  int? couponId;
  bool? whenWritten;
  String? expirationDate ;
  String? itemDate  ;
  int? itemId ;



  @override
  addCart(itemId) async{
    statusRequest= StatusRequest.loading;
    var response = await cartData.add(
    services.preferences!.getString("id")!, itemId);
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response["status"] == "success"){
        Get.rawSnackbar(
          title: "Haye",
          message: "your product added to Cart List",
          backgroundColor: Colors.green,
          borderRadius: 25,
          padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          duration:const Duration(seconds: 2),

        );
      }else{
        statusRequest =StatusRequest.failure;
      }
    }


  }

  @override
  removeCart(itemId) async{
    statusRequest= StatusRequest.loading;
    var response = await cartData.remove(
     services.preferences!.getString("id")!, itemId);
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success"){
        Get.rawSnackbar(
          title: "Haye",
          message: "your product removed from Cart List",
          backgroundColor: Colors.red,
          borderRadius: 25,
          padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          duration:const Duration(seconds: 2),
        );
      }else{
        statusRequest =StatusRequest.failure;
      }
    }
  }

  resetData(){
    responseCount = 0;
    responsePrice = 0.0 ;
   dataCart.clear();
  }

  refreshData(){
    resetData();
    viewCart();
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
          //if(response["datacart"]["status"] == "success"){
          List responseData = response["datacart"];
          dataCart.addAll(responseData.map((e) => CartModel.fromJson(e)));
          Map countAndPrice =  response["countandprice"] ;
          responseCount = int.parse(countAndPrice["totalcount"].toString());
          responsePrice = double.parse(countAndPrice["totalprice"].toString());
          expirationDate = countAndPrice["expairedate"].toString();
          print("==================================================");
          print("==================================================");
          print("datacart===============================$dataCart");
          print("==================================================");
          print("==================================================");
          print("countandprice====================$countAndPrice");
          print("==================================================");
          print("==================================================");
          //}

        }else{
          statusRequest =StatusRequest.failure;
        }
      }

    update();

  }

  @override
  getCountItems(itemId) async {
    statusRequest= StatusRequest.loading;
    var response = await cartData.getCountItemsFromCart(
        services.preferences!.getString("id")!, itemId);
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success"){
        int count = 0;
        count = int.parse(response['data'].toString());
        print("=======================================================");
        print("$count");
        return count;
      }else{
        statusRequest =StatusRequest.failure;
      }
    }
  }




  @override
  void onInit() {
    nameCoupon = TextEditingController();
    // itemPrice = Get.arguments['itemprice'];
    viewCart();
    super.onInit();
  }

  @override
  void dispose() {
    nameCoupon.dispose();
    super.dispose();
  }

  @override
  back() {
   Get.back();
  }

  @override
  coupon() async {
    if(formState.currentState!.validate()){
      whenWritten = false;
      statusRequest= StatusRequest.loading;
      update();
      var response = await cartData.copon(nameCoupon.text);
      print("==================================================$response");
      statusRequest = handleStatus(response);
      if(StatusRequest.success == statusRequest){
        if(response['status']=="success"){
          Map<String,dynamic> responseData = response["data"];
          couponModel = CoponModel.fromJson(responseData);
          couponDiscount = couponModel!.coponDiscount ;
          couponNamed =couponModel!.coponName;
          couponId = couponModel!.coponId;
          expirationDate = couponModel!.coponExpairdate!;
        }else{
          couponDiscount = 0 ;
          couponNamed = null;
          couponId = null;
          Get.rawSnackbar(
            title: "Haye",
            message: "No discount was found for this name",
            backgroundColor: Colors.red,
            borderRadius: 25,
            padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          );
        }
      }
    }else{
      whenWritten =true;
      print("not valid");}
    update();
  }


  @override
  getTotalPrice(){
    return responsePrice - responsePrice * couponDiscount! / 100 ;
  }

  @override
  goToCheckOut() {
    if(dataCart.isEmpty) return Get.snackbar("Haye!", "the basket is empty!");
    Get.toNamed(AppRoutes.checkout,arguments: {
      "coponid":couponId ?? 0,
      "orderprice":responsePrice,
      "copondiscount" : couponDiscount,
      "listofproducts" :dataCart,
      //"itemprice" : itemPrice,
    });
  }
  

}