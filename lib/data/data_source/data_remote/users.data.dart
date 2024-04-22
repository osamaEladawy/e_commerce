import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/linkapi.dart';

class UsersData {
  final Curd curd;

  UsersData({required this.curd});
  
  getSingleUsers({required String userid}) async {
    var result = await curd.postRequest(ApiLink.users, {
      "userid" : userid.toString() 
    });
    return result.fold((l) => l, (r) => r);
  }
}
