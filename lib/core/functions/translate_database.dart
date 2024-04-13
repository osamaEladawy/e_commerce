import 'package:e_commerce_app/core/services/my_services.dart';
import 'package:get/get.dart';

translateDatabase(columnar,columnen){
  MyServices services = Get.find();
  if(services.preferences!.getString("lang") == "ar"){
    return columnar;
  }else{
    return columnen;

  }
}