import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/approutes.dart';
import '../../core/functions/handleStatus_response.dart';
import '../../core/services/my_services.dart';
import '../../data/data_source/data_remote/orders/orders_data.dart';
import '../../data/model/pendingorders_model.dart';

abstract class ArchiveOrdersController extends GetxController{
  getOrders();
  printOrderType(int val);
  printPaymentMethod(int val);
  printOrderStatus(int val);
  back();
  rating(int orderid,double rating,String comment);
  goToProductDetiales(PendingOrdersModel pendingOrdersModel);

}

class ArchiveOrdersControllerImp extends ArchiveOrdersController{
  OrdersData ordersData = OrdersData(curd: Get.find());
  MyServices services = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<PendingOrdersModel>data = [];


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
  getOrders() async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.archiveOrders(services.preferences!.getString("id")!);
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
  rating(int orderid, double rating, String comment) async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.rating(orderid,rating,comment);
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response["status"] == "success"){
      getOrders();
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToProductDetiales(pendingOrdersModel) {
    Get.toNamed(AppRoutes.detialesOrders,arguments: {
      "orderdetails":pendingOrdersModel,
    });
  }

}