
import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/linkapi.dart';

class ResetPasswordData{
  Curd curd = Curd();

  ResetPasswordData({required this.curd});

  resetPassword(String email , String password)async{
    var response = await curd.postRequest( ApiLink.resetpassword,{
      "email":email,
      "password":password,
    });
    return response.fold((l) => l, (r) => r);
  }
}