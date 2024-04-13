import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controller/tracking_controller.dart';

class Tracking extends StatelessWidget {
  const Tracking({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking"),
      ),
      body: GetBuilder<TrackingControllerImp>(
        builder: (controller) => Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GoogleMap(
                  polylines: controller.polylineSet,
                  markers: controller.markers.toSet(),
                  initialCameraPosition: controller.cameraPosition,
                  onMapCreated: (GoogleMapController google) {
                    //controller.completerController.complete(google);
                    controller.completerController = google;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
