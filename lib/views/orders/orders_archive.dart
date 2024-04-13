import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';

import '../../controller/orders/archiveorder_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../widgets/orders/customarchiveorder_list.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});

  @override
  Widget build(BuildContext context) {
    ArchiveOrdersControllerImp controller = Get.put(ArchiveOrdersControllerImp());
    return Scaffold(
      appBar: AppBar(
        title:const Text("Archive"),
        leading: IconButton(
            onPressed: () {
              controller.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body:  Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<ArchiveOrdersControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return CustomListCardArchive(pendingOrdersModel: controller.data[index],);
                }),
          ),
        ),
      ),
    );
  }
}
