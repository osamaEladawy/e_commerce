import 'package:e_commerce_app/core/class/handlingdata_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controller/address/add_address_controller.dart';

class AddAdress extends StatelessWidget {
  const AddAdress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Your Locations"),
      ),
      body: GetBuilder<AddAddressControllerImp>(
        builder: (controllerImp) => HandlingDataView(
          statusRequest: controllerImp.statusRequest,
          widget: Column(
            children: [
              if (controllerImp.camera != null)
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      GoogleMap(
                        markers: controllerImp.markers.toSet(),
                        initialCameraPosition: controllerImp.camera!,
                        onTap: (LatLng latLng) {
                          controllerImp.addMark(latLng);
                        },
                        onMapCreated: (controller) {
                          controllerImp.completerController = controller;
                        },
                      ),
                      Container(
                        margin:const EdgeInsets.only(bottom: 10),
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width - 120,
                          height: 40,
                          shape: const StadiumBorder(),
                          color: Colors.grey[300],
                          onPressed: () {
                            controllerImp.goToCompleteInfo();
                          },
                          child: Text(
                            "Complete entering\n your information",
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
