import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:e_commerce_app/views/home/home.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../views/screens/notification.dart';
import '../../views/screens/offers.dart';
import '../../views/screens/settings.dart';


abstract class HomeScreenController extends GetxController{
  chanPage(int i);
  goToCart();
}

class HomeScreenControllerImp extends HomeScreenController{
int currentPage = 0;
Curd curd = Get.find();

logOutt(){
  curd.logOutFromGoogle();
 Get.offAllNamed(AppRoutes.login);
}

  List<Widget> pages = [
    const HomePage(),
    const NotificationPage(),
    const OffersPage(),
    const SettingsPage(),
  ];

  List words =[
    {"title": "Home","icon":Icons.home},
    {"title": "notifiy","icon":Icons.notifications_active_outlined},
    {"title": "Offers","icon":Icons.shop_2_outlined},
    {"title": "settings","icon":Icons.settings},
  ];
  @override
  chanPage(int i) {
  currentPage = i;
  update();
  }

  @override
  goToCart() {
  Get.toNamed(AppRoutes.cart);
  }

}