import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:e_commerce_app/core/services/my_services.dart';
import 'package:e_commerce_app/data/data_source/data_remote/auth/login_data.dart';
import 'package:e_commerce_app/data/model/users_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/functions/handleStatus_response.dart';

abstract class LoginController extends GetxController{
  login();

  goToSignup();

  goToForgetPassword();
  
  loginWithGoogle();

  saveMyAccount(bool value);
}

class LoginControllerImp extends LoginController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  LoginData loginData = LoginData(curd: Get.find());
  MyServices services = Get.find();

  final GoogleSignIn googleSignIn = GoogleSignIn();


 List <UsersModel> users = [];
 late TextEditingController email ;
 late TextEditingController password ;
 StatusRequest statusRequest = StatusRequest.none;
 bool isShowingPassword = true ;
 bool myAccount = false ;

 

 showAndHiddinPassword(){
   isShowingPassword = isShowingPassword == true ? false : true;
   update();
 }

  @override
  goToSignup() {
 Get.offNamed(AppRoutes.signUp);
  }

  @override
  login()async {
   if(formState.currentState!.validate()){
     statusRequest = StatusRequest.loading;
     update();
     var response= await loginData.loginData(email.text, password.text);
     print("response controller....................................$response");
     statusRequest = handleStatus(response);
     if(StatusRequest.success == statusRequest){
       if(response["status"] == "success"){

        if(response["data"]["users_approve"] == 1){
          services.preferences!.setString("id", response["data"]["users_id"].toString());
          String userid = services.preferences!.getString("id")!;
          services.preferences!.setString("username",  response["data"]["users_name"]);
          services.preferences!.setString("email",  response["data"]["users_email"]);
          services.preferences!.setString("phone",  response["data"]["users_phone"]);
          services.preferences!.setBool("onboarding", true);
          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance.subscribeToTopic("users${userid}");
          Get.offAllNamed(AppRoutes.homePage);
        }else{
          Get.offNamed(AppRoutes.verficationSignUp,arguments: {
            "email":email.text,
          });
        }
       }else{
         Get.defaultDialog(
             title: "Warning",middleText: "Email or Phone Number not correct");
         statusRequest = StatusRequest.failure;
       }
     }
     update();
   }else{
     print("not validate");
   }

   update();
  }

  @override
  void onInit() {
   FirebaseMessaging.instance.getToken().then((value){
     String? token = value;
    //  FirebaseAuth.instance.authStateChanges().listen((event) {
    //   if(event != null){
    //     Get.offNamedUntil(AppRoutes.homePage, (route) => false);
    //   }else{
    //    Get.offAllNamed(AppRoutes.login);

    //   }
    //  });
     print(token);
   });
   email = TextEditingController();
   password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
   Get.offNamed(AppRoutes.forgetPassword);
  }
  
  @override
  saveMyAccount(value) {
   myAccount = value;
   if(myAccount == true){
   services.preferences!.setString("mail", email.text); 
   services.preferences!.setString("password", password.text);

   }
   update();
  }
  
  @override
 loginWithGoogle() async{
    statusRequest = StatusRequest.loading;
     await loginData.loginByGoogle();
    Get.offAllNamed(AppRoutes.homePage);
    update();
  }
  

}






/*
1-input my account and password,
2- remember me (save my data) ,
-enable check box,
-when check box is true,save data now,
-save email and password by using shared preferences,



3-check for my account and password, when witch found go to home page,
 */