import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:e_commerce_app/data/data_source/data_remote/auth/verfycode_signup_data.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handleStatus_response.dart';

abstract class VerficationSignUpController extends GetxController{
  gotoSuccessSignUp(String verificationCode);
}

class VerficationSignUpControllerImp extends VerficationSignUpController{

VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(curd: Get.find());
StatusRequest statusRequest = StatusRequest.none;
late String email;


  @override
  gotoSuccessSignUp(String verificationCode) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiyCodeSignUpData.verfiyData(email, verificationCode);
    print("response controller....................................$response");
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response["status"] == "success"){
        Get.offNamed(AppRoutes.successSignUp);
      }else{
        Get.defaultDialog(
            title: "Warning",
            middleText: "VerifyCode Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

//587
  @override
  void onInit() {
   email = Get.arguments['email'];
    super.onInit();
  }


  resendVerficationCode(){
     verfiyCodeSignUpData.resendCode(email);
     update();
  }

}