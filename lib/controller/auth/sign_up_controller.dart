import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:e_commerce_app/data/data_source/data_remote/auth/signup_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/functions/handleStatus_response.dart';


/*it used to delete or clear data from current page when navigation to next page,
      three away to make this,
       Get.delete<SignUpControllerImp>();
       used laztput in current page,
       used bidding
*/
abstract class SignUpController extends GetxController{
  signUp();
  goToLogin();
  goToCheckEmail();
}

class SignUpControllerImp extends SignUpController{

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  SignUpData signUpData  = SignUpData(curd:Get.find(),);


  late TextEditingController email ;
  late TextEditingController password;
  late TextEditingController phone ;
  late TextEditingController username ;
   StatusRequest statusRequest = StatusRequest.none;
   bool isShowingPassword = true;

   showAndHiddenPass(){
     isShowingPassword = isShowingPassword == true ? false : true;
     update();
   }


  @override
  goToLogin() {
   Get.offAllNamed(AppRoutes.login) ;
  }

  @override
  signUp() async{
  // try{
     if(formState.currentState!.validate()){
       statusRequest = StatusRequest.loading;
       update();
       var response = await signUpData.postData(username.text, email.text, phone.text, password.text);
       print("response controller....................................$response");
       statusRequest = handleStatus(response);
       if(StatusRequest.success == statusRequest){
         if(response["status"] == "success"){
           Get.offNamed(AppRoutes.verficationSignUp,arguments: {
             'email':email.text,
           });
         }else{
           Get.defaultDialog(title: "Warning",middleText: "Email or Phone Number is already found");
           statusRequest = StatusRequest.failure;
         }
       }
       update();
     }else{
       print("not valid");
     }

   // }on FormatException catch(e){
   //   print("error controller : $e");
   //  throw  Exception("error controller $e");
   // }
  }



  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    username.dispose();
    super.dispose();
  }

  @override
  goToCheckEmail() {
   Get.offNamed(AppRoutes.verficationSignUp);
  }


}