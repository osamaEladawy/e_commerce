import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:e_commerce_app/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handleStatus_response.dart';
import '../../core/services/my_services.dart';
import '../../data/data_source/data_remote/cart_data.dart';

abstract class ItemsDetialescontroller extends GetxController {
  add();
  remove();
  addCart(int itemid);
  removeCart(int itemid);
  getcountitems(int itemid);
  
  changeColors(int index);
 
  goToCart();
}

class ItemsDetialescontrollerImp extends ItemsDetialescontroller {
  late ItemsModel itemsModel;
  StatusRequest statusRequest = StatusRequest.none;
  CartData cartData = CartData(curd: Get.find());
  MyServices services  = Get.find();
  int indexColor =  0 ;
  int count = 0;
  bool iscolor = false;
  String colors = '';

  
  List subItems = [
    {"name": "Red", "active": "red"},
    {"name": "Blue", "active": "blue"},
    {"name": "Yellow", "active": "yellow",},
  ];

  color(String newcolor){
 colors = newcolor ;
 update();
  }

  initialData() async{
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['productdetails'];
    count = await getcountitems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  addCart(itemid) async{
    statusRequest= StatusRequest.loading;
    update();
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
    update();

  }

  @override
  removeCart(itemid) async{
    statusRequest= StatusRequest.loading;
    update();
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
    update();
  }

  @override
  getcountitems(itemid) async {
    statusRequest= StatusRequest.loading;
    update();
    var response = await cartData.getCountItemsFromCart(
        services.preferences!.getString("id")!, itemid);
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success"){
        count = int.parse(response['data'].toString());
        print("=======================================================");
        print("$count");
        return count;
      }else{
        statusRequest =StatusRequest.failure;
      }
    }
    update();
  }



  @override
  add() {
    addCart(itemsModel.itemsId!);
     count++;
     update();
  }

  @override
  remove() {
    if(count > 0){
      removeCart(itemsModel.itemsId!);
      count--;
      update();
    }else{
      Get.rawSnackbar(
        title: "Haye!",
        message: "you removed all products",
        backgroundColor: Colors.orange,
        borderRadius: 25,
        padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        duration:const Duration(seconds: 2),
      );
    }
  }

  @override
  goToCart() {
   Get.toNamed(AppRoutes.cart);
   update();
  }
  
  @override
  changeColors(int index) {
   indexColor = index ; 
   update();
  }


}
