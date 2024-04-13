import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

import '../../controller/orders/pendingorder_controller.dart';

requestPermission()async{
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
}

receiveNotification() {
  FirebaseMessaging.onMessage.listen((event) {
    print("==============notification===================");
    print(event.notification!.title);
    print(event.notification!.body);
    FlutterRingtonePlayer().playNotification();
    Get.snackbar("${event.notification!.title}", "${event.notification!.body}");
    refreshOrders(event.data);
  });
}
  refreshOrders(data){
  //print("refreshMyOrders=======================");
  //print(Get.currentRoute);
  if(Get.currentRoute == "/pendingorders" && data["pagename"] == "refreshorders"){
    PendingOrdersControllerImp controllerImp = Get.find();
    controllerImp.refreshAllOrders();
    print("success ===      refresh order");
  }
}