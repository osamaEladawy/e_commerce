import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controller/orders/detialesorder_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../../core/functions/translate_database.dart';

TextStyle style = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 18,
  color: Colors.red,
);

class DetailsOrder extends StatelessWidget {
  const DetailsOrder({super.key});

  @override
  Widget build(BuildContext context) {
    DetialsOrderControllerImp controller = Get.put(DetialsOrderControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Orders"),
        leading: IconButton(
          onPressed: () {
            controller.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<DetialsOrderControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Table(
                  children: [
                    TableRow(
                      children: [
                        Text("Product",
                            textAlign: TextAlign.center, style: style),
                        Text(
                          "QTY",
                          textAlign: TextAlign.center,
                          style: style,
                        ),
                        Text(
                          "Price",
                          textAlign: TextAlign.center,
                          style: style,
                        ),
                      ],
                    ),
                    ...List.generate(
                      controller.data.length,
                      (index) =>  TableRow(
                        children: [
                          Text(
                            "${translateDatabase(controller.data[index].itemsNameAr, controller.data[index].itemsName)}",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "${controller.data[index].itemscount}",
                            textAlign: TextAlign.center,
                          ),
                          Text("${controller.data[index].cartItemsprice}", textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Total Price ::",
                      textAlign: TextAlign.center,
                      style: style,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      "${controller.pendingOrdersModel.ordersTotalprice}\$",
                      textAlign: TextAlign.center,
                      style: style,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
               if (controller.pendingOrdersModel.ordersType == 0 && controller.pendingOrdersModel.ordersStatus == 3 )
                Card(
                  child: ListTile(
                    title: Text(
                      "Shapping Address",
                      style: style,
                    ),
                    subtitle:  Text("${controller.pendingOrdersModel.addressCity}/${controller.pendingOrdersModel.addressStreet}"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
               if (controller.pendingOrdersModel.ordersType == 0 && controller.pendingOrdersModel.ordersStatus == 3 )
                  Card(
                  child: Container(
                    padding:const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      markers: controller.markers.toSet(),
                      initialCameraPosition: controller.camera!,
                      onTap: (LatLng latLng) {},
                      onMapCreated: (controllerGoogle) {
                        controller.completerController1!
                            .complete(controllerGoogle);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
