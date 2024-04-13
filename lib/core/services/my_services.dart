
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService{  
  //input in the class any thing , i want show to user when starting application,
  SharedPreferences? preferences;

  //create function (return subtyp of class) to initialize the shared preferences,
Future<MyServices> init()async{

  await Firebase.initializeApp(options:
 const FirebaseOptions(
      apiKey: "AIzaSyBwjHl_sAkK2ga6Ijhz_GSldzHGJ35pM58",
      appId:  "1:877768213935:android:feedbde3a7b59beded1b5a",   
      messagingSenderId: "877768213935",
      projectId:  "ecommerce-b85ec",
      storageBucket:  "ecommerce-b85ec.appspot.com")
  );
  preferences = await SharedPreferences.getInstance();
  return this;
}
/*
create function to used to main to intitialize this class,
and show my services when starting application
*/
initializeService()async{
  await Get.putAsync(() => MyServices().init(),);
}


}