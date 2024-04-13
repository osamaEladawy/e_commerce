
import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/linkapi.dart';

class CheckEmailData{
  Curd curd = Curd();

  CheckEmailData({required this.curd});

  checkEmail(String email )async{
    var response = await curd.postRequest( ApiLink.checkemail,{
      "email":email,
    });
    return response.fold((l) => l, (r) => r);
  }
}