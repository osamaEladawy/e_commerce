
import 'package:e_commerce_app/linkapi.dart';

import '../../../core/class/curd.dart';

class NotificationData {
  Curd curd;
  NotificationData({required this.curd});

  getData(String userid)async{
    var response = await curd.postRequest(ApiLink.notification, {
      "userid" :userid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteNotification(int id)async{
    var response = await curd.postRequest(ApiLink.deleteNotification,{
      "id" :id.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}