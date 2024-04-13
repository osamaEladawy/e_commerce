
import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/linkapi.dart';

class CartData{
  Curd curd;
  CartData({required this.curd});

  add(String userid, int itemid)async{
    var result = await curd.postRequest(ApiLink.addCart, {
      "usersid": userid.toString(),
      "itemsid": itemid.toString() ,
    });

    return result.fold((l) => l, (r) => r);
  }

  remove(String userid , int itemid)async{
    var result = await curd.postRequest(ApiLink.deleteCart, {
      "usersid" : userid.toString(),
      "itemsid": itemid.toString(),
    });
    return result.fold((l) => l, (r) => r);
  }

  getCountItemsFromCart(String userid , int itemid)async{
    var result = await curd.postRequest(ApiLink.getcountitems, {
      "usersid" : userid.toString(),
      "itemsid": itemid.toString(),
    });
    return result.fold((l) => l, (r) => r);
  }

  viewCart(String userid)async{
    var result = await curd.postRequest(ApiLink.viewCart, {
      "usersid" : userid.toString(),
    });
    return result.fold((l) => l, (r) => r);
  }

  copon(String namecopon)async{
    var result = await curd.postRequest(ApiLink.copon, {
      "namecopon" : namecopon,
    });
    return result.fold((l) => l, (r) => r);
  }

coponView()async{
    var result = await curd.postRequest(ApiLink.coponview, {});
    return result.fold((l) => l, (r) => r);
  }

}