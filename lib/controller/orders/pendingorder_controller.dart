import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:e_commerce_app/core/functions/handleStatus_response.dart';
import 'package:e_commerce_app/data/data_source/data_remote/orders/orders_data.dart';
import 'package:get/get.dart';

import '../../core/services/my_services.dart';
import '../../data/model/pendingorders_model.dart';

abstract class PendingOrdersController extends GetxController{
getOrders();
back();
printOrderType(int val);
printPaymentMethod(int val);
printOrderStatus(int val);
refreshAllOrders();
goToDetiales();
deleteOrders(int orderid);
goToTracking(PendingOrdersModel pendingOrdersModel);

}

class PendingOrdersControllerImp extends PendingOrdersController{
  OrdersData ordersData = OrdersData(curd: Get.find());
  MyServices services = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<PendingOrdersModel>data = [];

  @override
  getOrders() async{
    data.clear();
  statusRequest = StatusRequest.loading;
  update();
  var response = await ordersData.pendingOrders(services.preferences!.getString("id")!);
  statusRequest = handleStatus(response);
  if(StatusRequest.success == statusRequest){
    if(response["status"] == "success"){
      List lists = response["data"];
      data.addAll(lists.map((e) =>PendingOrdersModel.fromJson(e)));
    }else{
      statusRequest = StatusRequest.failure;
    }
  }
  update();
  }

  @override
  back() {
   Get.back();
  }

  @override
  String printOrderStatus(val) {
    if(val == 0){
      return "Your Order pending approval" ;
    }else if(val == 1){
      return "Your Order prepares now!";
    }else if(val == 2){
      return "Your Order recive to delivery man" ;
    }else if(val == 3){
      return "Your Order on the way" ;
    }else{
      return "archive" ;
    }
  }

  @override
  String printOrderType( val) {
    if(val == 0){
      return "Delivery" ;
    }else{
      return "Receive" ;
    }
  }

  @override
  String printPaymentMethod(val) {
    if(val == 0){
      return "Cash" ;
    }else{
      return "Cards" ;
    }
  }


  @override
  void onInit() {
    getOrders();
    super.onInit();
  }

  @override
  refreshAllOrders() {
   getOrders();
  }

  @override
  goToDetiales() {
   Get.toNamed(AppRoutes.detialesOrders,arguments: {
     "orderdetails" : data,
   });
  }

  @override
  deleteOrders(orderid) async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.deleteOrders(orderid);
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response["status"] == "success"){
      refreshAllOrders();
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToTracking(PendingOrdersModel pendingOrdersModel) {
   Get.toNamed(AppRoutes.tracking,arguments: {
     "orderdetails" : pendingOrdersModel,
   });
  }

}