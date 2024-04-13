
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
  addCart(int itemid);
  removeCart(int itemid);
  getcountitems(int itemid);
  viewCart();
  copon();
  back();
  getTotalPrice();
  goToCheckOut();
}

class CratControllerImp extends CartController{
  CartData cartData = CartData(curd: Get.find());
  MyServices services  = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  List<CartModel>datacart = [];
  late CartModel cartModel;
  List<CoponModel> copons=[];

  int responseCount = 0;
  double responsePrice = 0.0 ;

  late TextEditingController nameCopon;
  GlobalKey<FormState>formState = GlobalKey<FormState>();
   CoponModel? coponModel;
  int? copondiscount = 0 ;
  String? coponNamed ;
  int? coponId;
  bool? whenWritten;
  String? expairedate ;
  String? itemDate  ;
  int? itemid ;



  @override
  addCart(itemid) async{
    statusRequest= StatusRequest.loading;
    var response = await cartData.add(
    services.preferences!.getString("id")!, itemid);
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response["status"] == "success"){
        Get.rawSnackbar(
          title: "Haaaay",
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
  removeCart(itemid) async{
    statusRequest= StatusRequest.loading;
    var response = await cartData.remove(
     services.preferences!.getString("id")!, itemid);
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success"){
        Get.rawSnackbar(
          title: "Haaaay",
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
   datacart.clear();
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
          datacart.addAll(responseData.map((e) => CartModel.fromJson(e)));
          Map countandprice =  response["countandprice"] ;
          responseCount = int.parse(countandprice["totalcount"].toString());
          responsePrice = double.parse(countandprice["totalprice"].toString());
          expairedate = countandprice["expairedate"].toString();
          print("==================================================");
          print("==================================================");
          print("datacart===============================$datacart");
          print("==================================================");
          print("==================================================");
          print("countandprice====================$countandprice");
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
  getcountitems(itemid) async {
    statusRequest= StatusRequest.loading;
    var response = await cartData.getCountItemsFromCart(
        services.preferences!.getString("id")!, itemid);
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
    nameCopon = TextEditingController();
    // itemPrice = Get.arguments['itemprice'];
    viewCart();
    super.onInit();
  }

  @override
  void dispose() {
   nameCopon.dispose();
    super.dispose();
  }

  @override
  back() {
   Get.back();
  }

  @override
  copon() async {
    if(formState.currentState!.validate()){
      whenWritten = false;
      statusRequest= StatusRequest.loading;
      update();
      var response = await cartData.copon(nameCopon.text);
      print("==================================================$response");
      statusRequest = handleStatus(response);
      if(StatusRequest.success == statusRequest){
        if(response['status']=="success"){
          Map<String,dynamic> responseData = response["data"];
          coponModel = CoponModel.fromJson(responseData);
          copondiscount = coponModel!.coponDiscount ;
          coponNamed =coponModel!.coponName;
          coponId = coponModel!.coponId;
          expairedate = coponModel!.coponExpairdate!;
        }else{
          copondiscount = 0 ;
          coponNamed = null;
          coponId = null;
          Get.rawSnackbar(
            title: "Haaaay",
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
    return responsePrice - responsePrice * copondiscount! / 100 ;
  }

  @override
  goToCheckOut() {
    if(datacart.isEmpty) return Get.snackbar("Haye!", "the basket is empty!");
    Get.toNamed(AppRoutes.checkout,arguments: {
      "coponid":coponId ?? 0,
      "orderprice":responsePrice,
      "copondiscount" : copondiscount,
      "listofproducts" :datacart,
      //"itemprice" : itemPrice,
    });
  }
  

}