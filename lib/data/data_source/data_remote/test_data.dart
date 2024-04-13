
import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/linkapi.dart';

class TestData{
   Curd curd;

   TestData({required this.curd});

   getData()async{
      var result = await curd.postRequest( ApiLink.test, {});
      return result.fold((l) => l, (r) => r);
   }
}