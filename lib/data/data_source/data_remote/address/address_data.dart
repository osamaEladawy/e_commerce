
import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/linkapi.dart';

class AddressData{
  Curd curd;
  AddressData({required this.curd});

  getData(String usersid)async{
    var result = await curd.postRequest(ApiLink.viewAddress, {
      "usersid":usersid,
    });
    return result.fold((l) => l, (r) => r);
  }

  deleteData(int addressid)async{
    var result = await curd.postRequest(ApiLink.removeAddress, {
      "addressid":addressid.toString(),
    });
    return result.fold((l) => l, (r) => r);
  }

  addData(String usersid,String addressname,String city,String street,double lat,double long)async{
    var result = await curd.postRequest(ApiLink.addAddress, {
      "usersid":usersid.toString(),
      "addressname":addressname,
      "city":city,
      "street":street,
      "lat":lat.toString(),
      "long":long.toString(),
    });
    return result.fold((l) => l, (r) => r);
  }
}