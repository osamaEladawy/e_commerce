
import 'package:e_commerce_app/linkapi.dart';

import '../../../../core/class/curd.dart';

class VerfiyCodeSignUpData{
  Curd curd;
  VerfiyCodeSignUpData({required this.curd});

  verfiyData(String email,String verfiycode)async{
    var result = await curd.postRequest(ApiLink.verfiySignupdata, {
      "email": email,
      "verifycode":verfiycode,
    });
    return result.fold((l) => l , (r) => r);
  }

  resendCode(String email)async{
    var result = await curd.postRequest(ApiLink.resendCode, {
      "email": email,
    });
    print("$result===================================================result");
    return result.fold((l) => l , (r) => r);
  }


}