import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/data/data_source/data_remote/forgrtpassword/resetpassword_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/approutes.dart';
import '../../core/functions/handleStatus_response.dart';

abstract class ResetPasswordController extends GetxController{
  goToSuccessToResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController{
  late TextEditingController password;
  late TextEditingController confirmPassword;
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState>formstate = GlobalKey<FormState>();
  ResetPasswordData resetPasswordData =ResetPasswordData(curd: Get.find());
  String? email;
bool isShowingPassword1 = true;
bool isShowingPassword2 = true;

  showAndHiddenPassOne(){
    isShowingPassword1 = isShowingPassword1 == true ? false : true;
    update();
  }
  showAndHiddenPassOne2(){
    isShowingPassword2 = isShowingPassword2 == true ? false : true;
    update();
  }



  @override
  goToSuccessToResetPassword() async {
   if(formstate.currentState!.validate()){
     if(password.text != confirmPassword.text){
     return  Get.defaultDialog(
           title: "Warning",
           middleText: "password no match!");
     }
     statusRequest = StatusRequest.loading;
     update();
     var response = await resetPasswordData.resetPassword(email!, password.text);
     print("response controller....................................$response");
     statusRequest = handleStatus(response);
     if(StatusRequest.success == statusRequest){
       if(response["status"] == "success"){
         Get.offNamed(AppRoutes.succesResetPass);
       }else{
         Get.defaultDialog(
             title: "Warning",
             middleText: "check your email and password");
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
    password = TextEditingController();
   confirmPassword = TextEditingController();
    super.onInit();
  }

}