
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/class/status_request.dart';
import '../core/functions/point_spacing.dart';
import '../core/services/my_services.dart';
import '../data/model/pendingorders_model.dart';

abstract class TrackingController extends GetxController {
  getCurrentPossions();
  getLocationDelivery();
  updateMarkersDelivery(double newLat,double  newLong);
  getPoint();
}

class TrackingControllerImp extends TrackingController {
  late CameraPosition cameraPosition;
  GoogleMapController? completerController;
  Set<Polyline> polylineSet = {};
  MyServices services = Get.find();

  bool isLoading = false;

  List<Marker> markers = [];
  late PendingOrdersModel pendingOrdersModel;
  StatusRequest statusRequest = StatusRequest.success;

  double? currentLat;
  double? currentLong;

  double? destinationLat;
  double? destinationLong;

  @override
  getCurrentPossions() {
    cameraPosition = CameraPosition(
      target: LatLng(
          pendingOrdersModel.addressLat!, pendingOrdersModel.addressLong!),
      zoom: 12.0,
    );
    markers.add(
      Marker(
        markerId: const MarkerId("current"),
        position: LatLng(
            pendingOrdersModel.addressLat!, pendingOrdersModel.addressLong!),
      ),
    );

  }

  @override
  getLocationDelivery() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc("${pendingOrdersModel.ordersId}")
        .snapshots()
        .listen((event) {
      if (event.exists) {
        destinationLat = event.get("lat");
        destinationLong = event.get("long");
        updateMarkersDelivery(destinationLat!, destinationLong!);
      }
    });
  }

  @override
  updateMarkersDelivery(double newLat,double  newLong) {
    markers.removeWhere((element) => element.markerId.value == "dest");
    markers.add(
      Marker(
        markerId: const MarkerId("dest"),
        position: LatLng(newLat, newLong),
      ),
    );
    update();
  }

  @override
  getPoint() async {
    destinationLat = pendingOrdersModel.addressLat;
    destinationLong = pendingOrdersModel.addressLong;
    await Future.delayed(const Duration(seconds: 1));
    polylineSet = await getData(currentLat, currentLong, destinationLat, destinationLong);
    update();
  }

  @override
  void onInit() {
    pendingOrdersModel = Get.arguments['orderdetails'];
    getCurrentPossions();
    getLocationDelivery();
    //getPoint();
    super.onInit();
  }

  @override
  void onClose() {
    completerController!.dispose();
    super.onClose();
  }
}
