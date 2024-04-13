import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/orders/pendingorder_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../widgets/orders/customcard_pendingorder.dart';


class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    PendingOrdersControllerImp controller =
        Get.put(PendingOrdersControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("pending orders"),
        leading: IconButton(
            onPressed: () {
              controller.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<PendingOrdersControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return CustomListCard(pendingOrdersModel: controller.data[index],);
                }),
          ),
        ),
      ),
    );
  }
}

