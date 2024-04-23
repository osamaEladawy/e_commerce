import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:e_commerce_app/core/services/my_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class SettingController extends GetxController{
  logOut();
  goToAddress();
  goToPending();
  goToArchive();
  changeSwitch(bool val);
  changeNotification(bool val);

    logOutGoogle();

}

class SettingControllerImp extends SettingController{
  MyServices services = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Curd curd = Get.find();

  bool value = false;
  bool notification = false ;
  late String userid ;

  @override 
  logOut() {
    String userid =services.preferences!.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    logOutGoogle();
    services.preferences!.clear();
    Get.offAllNamed(AppRoutes.login);
  }

    @override
   logOutGoogle() async{
   await curd.logOutFromGoogle();
  }


  @override
  goToAddress() {
 Get.toNamed(AppRoutes.viewAddress);
  }

  @override
  changeSwitch(val) {
   value = val;
   update();
  }

  @override
  goToArchive() {
   Get.toNamed(AppRoutes.archiveOrders);
  }

  @override
  goToPending() {
    Get.toNamed(AppRoutes.pendingOrders);
  }

  @override
  changeNotification(bool val) {
  if(notification=val == true){
    FirebaseMessaging.instance.subscribeToTopic("users");
    FirebaseMessaging.instance.subscribeToTopic("users${userid}");
  }else{
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
  }
  update();
  }
@override
  void onInit() {
    userid =  services.preferences!.getString("id")!;
    super.onInit();
  }

}