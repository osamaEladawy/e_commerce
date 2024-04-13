import 'package:e_commerce_app/core/constant/apptheme.dart';
import 'package:e_commerce_app/core/functions/firebase_notification.dart';
import 'package:e_commerce_app/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
/*
  this is class used to change the language in application,
  steps;
  1-create variables from Local,
  2-create instance from my service,to can me used prefrence,
  3-create function to used choose the language and saved it,
  4-intialize default language in onitial,
*/

class LocalLanguagesController extends GetxController{

  late bool islocationServerEnabled;
  late LocationPermission permission;
  late Position position;
  late  Geolocator geolocator;


  Locale? language;

  ThemeData appTheme = themeEnglish;

  MyServices services = Get.find();

//it used to choose the language,and saves it,
  changeLanguage(String codeLanguage){
    Locale locale = Locale(codeLanguage);
    services.preferences!.setString("lang", codeLanguage);
    appTheme = codeLanguage == "ar" ? themeArabic : themeEnglish ;
    Get.changeTheme(appTheme);
   //to update the user's choice,
    Get.updateLocale(locale);
  }

  requestPermission2()async{
  islocationServerEnabled = await Geolocator.isLocationServiceEnabled();
  if(!islocationServerEnabled){
    print("location service is not enabled");
    return Get.snackbar("Hello!", "please enable location service",
        backgroundColor: Colors.grey,borderRadius: 25);
  }
  permission = await Geolocator.checkPermission();
  if(permission == LocationPermission.denied){
    print("send request to user to enable location service",);
    permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied){
      print("please enable location service and allow the application access to the location service");
      return Get.snackbar("Hello!", "please enable location service and allow the application access to the location service",
          backgroundColor:Colors.green,borderRadius: 25);
    }
  }
  if(permission == LocationPermission.deniedForever){
    return Get.snackbar("Haye!", "please enable location service and allow the application access to the location service to can use the applicaion",
    backgroundColor: Colors.red,borderRadius: 25);

  }
}

initializeLanguage(){
  String? preferenceLang = services.preferences!.getString("lang");
  if(preferenceLang == "ar"){
    language = const Locale("ar");
    appTheme = themeArabic;
  }else if(preferenceLang == "en"){
    language = const Locale("en");
    appTheme = themeEnglish;
  }else{
    language = Locale(Get.deviceLocale!.languageCode);
    //appTheme = themeEnglish;
  }
}
// initialize default language when starting application,
  @override
  void onInit() {
    requestPermission();
    receiveNotification();
    requestPermission2();
     initializeLanguage();
    super.onInit();
  }
}