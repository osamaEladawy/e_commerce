
import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/linkapi.dart';

class LoginData{
  Curd curd = Curd();

  LoginData({required this.curd});

  loginData(String email , String password)async{
    var response = await curd.postRequest( ApiLink.login,{
      "email":email,
    "password":password,
    });
    return response.fold((l) => l, (r) => r);
  }

  loginByGoogle()async{
    var response = await curd.signInWithGoogle();
    return response;
  }
}