import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:e_commerce_app/data/data_source/data_remote/forgrtpassword/verifycode_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handleStatus_response.dart';

abstract class VervicationController extends GetxController{
  goToResetPassword();
  checkCode(String verfiyCode);
}

class VervicationControllerImp extends VervicationController{
  VerifyCodeData verifyCodeData = VerifyCodeData(curd: Get.find());
   GlobalKey<FormState>formSatate = GlobalKey<FormState>();

  StatusRequest statusRequest =StatusRequest.none;
  String? email;
  @override
  goToResetPassword() {
    Get.offNamed(AppRoutes.resetPassword);
  }

  @override
  checkCode(String verfiyCode) async {
   if(formSatate.currentState!.validate()){
     statusRequest = StatusRequest.loading;
     update();
     var response = await verifyCodeData.verficationCode(email!, verfiyCode);
     print("response controller....................................$response");
     statusRequest = handleStatus(response);
     if(StatusRequest.success == statusRequest){
       if(response["status"] == "success"){
         Get.offNamed(AppRoutes.resetPassword,arguments: {
           'email' : email,
         });
       }else{
         Get.defaultDialog(
             title: "Warning",
             middleText: "VerifyCode Not Correct");
         statusRequest = StatusRequest.failure;
       }
     }
     update();
   }else{
     print("not valid");
   }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

}