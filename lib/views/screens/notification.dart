import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../controller/options/notification_controller.dart';
import '../../core/class/handlingdata_view.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<NotificationControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                ...List.generate(
                  controller.data.length,
                  (index) => Card(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          ListTile(
                            title: Text(
                                "${controller.data[index].notificationTitle}"),
                            subtitle: Text(
                                "${controller.data[index].notificationBody}"),
                          ),
                          Positioned(
                            right: 0,
                            top: 11,
                            child: Text(Jiffy.parse(
                                    '${controller.data[index].notificationDatetime}')
                                .fromNow()),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                              onPressed: () {
                                controller.deleteNotification(controller.data[index].notificationId!);
                              },
                              icon: const Icon(Icons.delete,color:Colors.red),
                            ),
                          ),
                        ],
                      ),
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
