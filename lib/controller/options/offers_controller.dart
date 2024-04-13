import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/data/data_source/data_remote/offers_data.dart';
import 'package:e_commerce_app/data/model/items_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/approutes.dart';
import '../../core/functions/handleStatus_response.dart';

abstract class OffersController extends GetxController{
getData();
goToFavourite();
goToDetiales(ItemsModel itemsModel);
listOfProducts();
checkSearch(value);
search();
}

class OffersControllerImp extends OffersController{
  StatusRequest statusRequest = StatusRequest.none;
  OffersData offersData = OffersData(curd: Get.find());
  String? lang ;
  List<ItemsModel> data = [];
  List<ItemsModel> listofmodel = [];
  GlobalKey<FormState>formState = GlobalKey<FormState>();
  late TextEditingController controller;
  bool isSearch = false;


  @override
  getData() async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await offersData.getData();
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
    var response= await offersData.searchForData(controller.text);
    print("response controller....................................$response");
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response["status"] == "success"){
        listofmodel.clear();
        List lists = response['data'];
        listofmodel.addAll(lists.map((e) => ItemsModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }



  @override
  void onInit() {
    controller = TextEditingController();
    getData();
    super.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  goToDetiales(itemsModel) {
  Get.toNamed(AppRoutes.productDetiales,arguments: {
    "productdetails" : itemsModel
  });
  }

}