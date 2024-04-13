
import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/linkapi.dart';

class OrdersData{
  Curd curd ;
  OrdersData({required this.curd});

  checkout(Map data)async{
    var response = await curd.postRequest(ApiLink.addorder, data);
    return response.fold((l) => l, (r) => r);
  }

  pendingOrders(String userid)async{
    var response = await curd.postRequest(ApiLink.pendingOrders, {
      "userid" :userid.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  ordersDetials(int orderid)async{
    var response = await curd.postRequest(ApiLink.ordersDetials, {
      "orderid" :orderid.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteOrders(int orderid)async{
    var response = await curd.postRequest(ApiLink.deleteOrders, {
      "orderid" :orderid.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  archiveOrders(String userid)async{
    var response = await curd.postRequest(ApiLink.archiveOrders, {
      "userid" :userid.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  rating(int orderid,double rating,String comment)async{
    var response = await curd.postRequest(ApiLink.rating, {
      "orderid" :orderid.toString(),
      "rating" :rating.toString(),
      "noterating" :comment.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

}