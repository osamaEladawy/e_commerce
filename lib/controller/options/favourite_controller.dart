import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/services/my_services.dart';
import 'package:e_commerce_app/data/data_source/data_remote/favourite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handleStatus_response.dart';

/*
create a favourite button,
1-i need to prameter (id for product selected),
*/
class FavouriteController extends GetxController {
//key = id for product selected,
//value = status now , means status favourite or not,(server data)
  Map isFavourite = {};
  List data = [];

  StatusRequest statusRequest = StatusRequest.none;
  MyServices services = Get.find();

  FavouriteData favouriteData = FavouriteData(curd: Get.find());

  setFavourite(key, value) async {
    isFavourite[key] = value;
    update();
  }

  addFavourite(int itemid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favouriteData.addFavouriteData(
    services.preferences!.getString("id")!, itemid);
    statusRequest = handleStatus(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        // data.addAll(response['data']);
        Get.rawSnackbar(
          title: "Haaaay",
          message: "your product added to favorites List",
          backgroundColor: Colors.green,
          borderRadius: 25,
          padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeFavourite(int itemid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favouriteData.removeFavouriteData(
        services.preferences!.getString("id")!, itemid);
    statusRequest = handleStatus(response);
    if (StatusRequest.success == statusRequest) { 
      if (response["status"] == "success") {
        // data.addAll(response['data']);
        Get.rawSnackbar(
          title: "Haaaay",
          message: "Your product has been removed from your favorites list",
          backgroundColor: Colors.red,
          borderRadius: 25,
          padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
     update();
  }
}
