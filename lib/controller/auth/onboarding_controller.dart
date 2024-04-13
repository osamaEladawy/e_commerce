import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:e_commerce_app/core/services/my_services.dart';
import 'package:e_commerce_app/data/data_source/static_data/stayic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
/*
when create controller,
1- initialize controller and dependencies to home page,
2-used getBuilder when changing into ui,
3-used getviews<genrator> when i want to view my information in screens,

*/
abstract class OnBoardingcontroller extends GetxController{

 //this function used to in move or navigation to next a screen with by using button,
  next();

  /*
this function used to change or reacte with the screens when it  navigation,
when i want linking screen to points,
1- create variables from dataType int,
2- intialize my variables in my function,

*/
  changePage(int index);

}

class OnBoardingcontrollerImp extends OnBoardingcontroller{
  late  int currentPage = 0;
  late PageController pageController;

  MyServices services = Get.find();



  @override
  changePage(int index) {
    currentPage = index ;
    update();
  }

  /*
   if user navigation to arrive a last screen,
   and  click on button again , must navigation to login page ,
   */
  @override
  next() {
  currentPage++;
  if(currentPage > onBoardingModelList.length - 1){ 
    services.preferences!.setBool("onboarding", false);
   Get.offAllNamed(AppRoutes.login);
  }else{
    pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 5000),
        curve: Curves.easeOutBack);
  }

  }

  //intialize to page controller to work when starting application,
  //to controller into boarding page,
@override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

}