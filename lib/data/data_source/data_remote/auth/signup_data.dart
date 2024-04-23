import 'package:e_commerce_app/linkapi.dart';

import '../../../../core/class/curd.dart';

class SignUpData {
  Curd curd;
  SignUpData({required this.curd});

  postData(
      {required String username,
      required String email,
      required String phone,
      required String password,
      String image = ""}) async {
    var result = await curd.postRequest(ApiLink.signUp, {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
      "image": image,
    });
    return result.fold((l) => l, (r) => r);
  }
}
