
import 'package:e_commerce_app/linkapi.dart';

import '../../../../core/class/curd.dart';

class SignUpData{
  Curd curd;
  SignUpData({required this.curd});

  postData(String username,String email,String phone,String password)async{
      var result = await curd.postRequest(ApiLink.signUp, {
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
      });
      return result.fold((l) => l , (r) => r);

  }

}