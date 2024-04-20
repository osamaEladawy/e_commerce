import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:e_commerce_app/core/services/my_services.dart';
import 'package:e_commerce_app/data/data_source/data_remote/myfavourite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handleStatus_response.dart';
import '../../data/model/items_model.dart';
import '../../data/model/myfavourite_modek.dart';

class MyFavoritesController extends GetxController {
  MyFavoriteData myFavorite = MyFavoriteData(curd: Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices services = Get.find();


  List<MyFavouriteModel> data = [];
  List<ItemsModel> listOfModel = [];

  GlobalKey<FormState>formState = GlobalKey<FormState>();
  late TextEditingController controller;
  bool isSearch = false;


  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myFavorite.myFavoriteData(services.preferences!.getString("id")!);
    //check for data, it is map || status request,
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      //check for operation is successful,
      if(response["status"] == "success"){
        List dataService =  response['data'];
        data.addAll(dataService.map((e) => MyFavouriteModel.fromJson(e)));
        //data.addAll(response['data']);
        print("data===========================myFavourite");
        print(data);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }

  checkSearch(value) {
    if(value.isEmpty){
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  search() {
    if(formState.currentState!.validate()){
      isSearch = true;
      listOfProducts();
    }else{
      print("not valid");
    }
    update();
  }


  listOfProducts() async{
    statusRequest = StatusRequest.loading;
    update();
    var response= await myFavorite.search(controller.text);
    print("response controller....................................$response");
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response["status"] == "success"){
        listOfModel.clear();
        List lists = response['data'];
        listOfModel.addAll(lists.map((e) => ItemsModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  deleteDataFromFavourite(int id) {
   myFavorite.deleteFromFavorite(id);
    data.removeWhere((element) => id == element.favouriteId);
    update();
  }

  goToDetailsProduct(ItemsModel itemsModel){
    Get.toNamed(AppRoutes.productDetiales,arguments: {
      "productdetails": itemsModel,
    });
  }

  @override
  void onInit() {
    controller = TextEditingController();
    getData();
    super.onInit();
  }
}
