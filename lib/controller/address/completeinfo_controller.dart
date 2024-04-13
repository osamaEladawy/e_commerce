import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:e_commerce_app/core/services/my_services.dart';
import 'package:e_commerce_app/data/data_source/data_remote/address/address_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/functions/handleStatus_response.dart';

abstract class CompleteInfoController extends GetxController{
addData();
}

class CompleteInfoControllerImp extends CompleteInfoController{
  AddressData addressData = AddressData(curd: Get.find());
  MyServices services = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  late double lat;
  late double long;

  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;


  initialData(){
    lat = Get.arguments["lat"];
    long = Get.arguments["long"];
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    print("=======================");
    print("$lat===========================");
    print("$long=============================");
    print("=======================");
  }



  @override
  void onInit() {
    initialData();
    super.onInit();
  }


  @override
  addData() async{
   if(formState.currentState!.validate()){
    statusRequest = StatusRequest.loading;
     update();
     var response = await addressData.addData(
         services.preferences!.getString("id")!, name.text, city.text, street.text, lat, long);
     //statusRequest = StatusRequest.none;
     statusRequest = handleStatus(response);
     if(StatusRequest.success == statusRequest){
       if(response['status']=="success"){
         Get.offAllNamed(AppRoutes.homePage);
         Get.snackbar("Thank's", "your adrees adding now") ;
       }else{
         statusRequest = StatusRequest.failure;
       }
     }
   }else{
     print("not validate");
   }
    update();
  }


}