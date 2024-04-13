import 'dart:async';

import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handleStatus_response.dart';
import 'package:e_commerce_app/data/data_source/data_remote/orders/orders_data.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/model/detialesorder_model.dart';
import '../../data/model/pendingorders_model.dart';

abstract class DetialsOrderController extends GetxController {
  back();

  getData();
}

class DetialsOrderControllerImp extends DetialsOrderController {
  OrdersData ordersData = OrdersData(curd: Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late PendingOrdersModel pendingOrdersModel;
  Completer<GoogleMapController>? completerController1;

  CameraPosition? camera;
  List<Marker> markers = [];
  List<DetialesOrdersModel> data = [];
  double? lat;
  double? long;

  initializeData() {
    if (pendingOrdersModel.ordersType == 0 ) {
      camera = CameraPosition(
        target: LatLng(
            pendingOrdersModel.addressLat!, pendingOrdersModel.addressLong!),
        zoom: 12.0,
      );
      markers.add(
        Marker(
            markerId: const MarkerId("1"),
            position: LatLng(pendingOrdersModel.addressLat!,
                pendingOrdersModel.addressLong!)),
      );
    }
  }

  @override
  void onInit() {
    pendingOrdersModel = Get.arguments["orderdetails"];
    completerController1 = Completer<GoogleMapController>();
    initializeData();
    getData();
    super.onInit();
  }

  @override
  back() {
    Get.back();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.ordersDetials(pendingOrdersModel.ordersId!);
    statusRequest = handleStatus(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List lists = response["data"];
        data.addAll(lists.map((e) => DetialesOrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
