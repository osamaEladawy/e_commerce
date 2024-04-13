import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:e_commerce_app/core/services/my_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware{


MyServices services = Get.find();

  @override
  set priority(int? _priority)=> 1 ;

  @override
  RouteSettings? redirect(String? route) {
    if( services.preferences!.get("onboarding") == true){
      return const RouteSettings(name: AppRoutes.homePage);
    }
    if( services.preferences!.get("onboarding") == false){
    return const RouteSettings(name: AppRoutes.login);
  }
    return null;

  }
}