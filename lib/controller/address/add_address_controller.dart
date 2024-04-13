import 'dart:async';

import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddAddressController extends GetxController {
  getCurrentPosition();

  addMark(LatLng latLng);

  goToCompleteInfo();
}

class AddAddressControllerImp extends AddAddressController {
  late bool islocationServerEnabled;
  late LocationPermission permission;
  late Position position;
  late Geolocator geolocator;
  CameraPosition? camera;
  List<Marker> markers = [];
  double? lat;
  double? long;

  CameraPosition cameraPosition =
      const CameraPosition(target: LatLng(33.758389, 35.873402), zoom: 14.0);

  late Completer<GoogleMapController> completerController1;

  StatusRequest statusRequest = StatusRequest.none;
  late GoogleMapController completerController;

  @override
  void onInit() {
    completerController1 = Completer<GoogleMapController>();
    getCurrentPosition();
    super.onInit();
  }

  @override
  getCurrentPosition() async {
    statusRequest = StatusRequest.loading;
    position = await Geolocator.getCurrentPosition();
    camera = CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 14.1);
    addMark(
      LatLng(position.latitude, position.longitude),
    );
    statusRequest = StatusRequest.none;
    update();
    print("=======================");
    print("$position===========================posision");
    print("$camera=============================camera");
    print("=======================");
  }

  @override
  addMark(latLng) {
    markers.add(
      Marker(markerId: const MarkerId("1"), position: latLng),
    );
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  @override
  goToCompleteInfo() {
    //send lat and long position
    if (lat == null && long == null ||
        lat == position.latitude && long == position.longitude) {
      return Get.defaultDialog(
          title: "Haye!",
          middleText: "please enter your location or current location",
          textConfirm: "current Location",
          textCancel: "choose a new location",
          barrierDismissible: false,
          onConfirm: (){
            if(lat == position.latitude && long == position.longitude){
              Get.toNamed(AppRoutes.completeAddress, arguments: {
                "lat": lat,
                "long": long,
              });

            }
             getCurrentPosition();
          },
          onCancel: () {});
    }
    Get.toNamed(AppRoutes.completeAddress, arguments: {
      "lat": lat,
      "long": long,
    });
    update();
  }
}
