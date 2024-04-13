import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/functions/handleStatus_response.dart';
import '../../data/data_source/data_remote/forgrtpassword/checkemail_data.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();

}

class ForgetPasswordControllerImp extends ForgetPasswordController{
  CheckEmailData checkEmailData = CheckEmailData(curd: Get.find());
  GlobalKey<FormState>formState  = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController email;

  @override
  checkEmail() async{
    if(formState.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.checkEmail(email.text);
      print("response controller....................................$response");
      statusRequest = handleStatus(response);
      if(StatusRequest.success == statusRequest){
        if(response["status"] == "success"){
          Get.offNamed(AppRoutes.verfiy,arguments: {
            'email':email.text,
          });
        }else{
          Get.defaultDialog(title: "Warning",middleText: "Email not found");
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
   email = TextEditingController();
    super.onInit();
  }


  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}