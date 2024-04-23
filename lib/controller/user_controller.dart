import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handleStatus_response.dart';
import 'package:e_commerce_app/core/services/my_services.dart';
import 'package:e_commerce_app/data/data_source/data_remote/users.data.dart';
import 'package:e_commerce_app/data/model/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class UsersController extends GetxController {
  //getData();
  getSingleUser();
}

class UsersControllerImp extends UsersController {
  UsersData usersData = UsersData(curd: Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  MyServices services = Get.find();

  List<UsersModel> users = [];

  UsersModel? usersModel;

  String? userPic = "";

 

  @override
  getSingleUser() async {
   // users.clear();
    statusRequest = StatusRequest.loading;
   // update();
    var response = await usersData.getSingleUsers(
        userid: services.preferences!.get("id").toString());
    print("response controller....................................$response");
    statusRequest = handleStatus(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List data = response['data'];
        users.addAll(data.map((e) => UsersModel.fromJson(e)));
        for (var e in users) {
          usersModel = e;
          userPic = e.usersImage!;
        }
      } else {
        //3277115
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  

  @override
  void onInit() {
    getSingleUser();
    super.onInit();
  }
}
