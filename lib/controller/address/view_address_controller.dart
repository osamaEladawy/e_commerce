
import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:e_commerce_app/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handleStatus_response.dart';
import '../../core/services/my_services.dart';
import '../../data/data_source/data_remote/address/address_data.dart';

abstract class ViewAddressController extends GetxController{
goToAddAdrees();
viewData();
removeData(int addressid);
deleteData(int addressid);


}

class ViewAddressControllerImp extends ViewAddressController{
  AddressData addressData = AddressData(curd: Get.find());
  MyServices services = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  List<AddressModel>data = [];


  @override
  goToAddAdrees() {
   Get.toNamed(AppRoutes.addAddress);
  }

  @override
  viewData() async{
    statusRequest = StatusRequest.loading;
    var response = await addressData.getData(services.preferences!.getString("id")!);
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success"){
        List lists = response["data"];
        data.addAll(lists.map((e) => AddressModel.fromJson(e)));
        if(data.isEmpty){
          statusRequest = StatusRequest.failure;
        }
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
   removeData(addressid)async {
    //statusRequest = StatusRequest.loading;
    var response = await addressData.deleteData(addressid);
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success"){
      return Get.rawSnackbar(
          title: "Haaaay",
          message: "already removed the address",
          backgroundColor: Colors.green,
          borderRadius: 25,
          padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          duration:const Duration(seconds: 2),

        );
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  @override
  void onInit() {
   viewData();
    super.onInit();
  }

  @override
  deleteData(int addressid) {
  addressData.deleteData(addressid);
  data.removeWhere((element) => element.addressId == addressid);
  update();
  }


}