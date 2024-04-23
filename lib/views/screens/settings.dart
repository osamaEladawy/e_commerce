import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/options/settings_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../../core/constant/initialize_color.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingControllerImp());
    UsersControllerImp userDetails = Get.put(UsersControllerImp());
    return Scaffold(
      body: GetBuilder<SettingControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: Get.width / 2,
                    color: Colors.orange,
                  ),
                  Positioned(
                    top: Get.width / 2.5,
                    child: Container(
                      height: 100,
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child:userDetails.usersModel != null ?
                         CachedNetworkImage(
                          imageUrl: "${userDetails.usersModel!.usersImage}",
                          placeholder: (context, child) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorWidget: (context, text, child) {
                            return const Center(
                              child: Text("no image"),
                            );
                          },
                        ):null,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Card(
                elevation: 0.3,
                child: Column(
                  children: [
                    controller.value == false
                        ? ListTile(
                            onTap: () {
                              controller.goToPending();
                            },
                            title: const Text("Pending Orders"),
                            trailing: Switch(
                              activeColor: AppColors.primaryColor,
                              inactiveThumbColor: Colors.red,
                              onChanged: (val) {
                                controller.changeSwitch(val);
                              },
                              value: controller.value,
                            ),
                          )
                        : ListTile(
                            onTap: () {
                              controller.goToArchive();
                            },
                            title: const Text("Archive Orders"),
                            trailing: Switch(
                              activeColor: AppColors.primaryColor,
                              inactiveThumbColor: Colors.red,
                              onChanged: (val) {
                                controller.changeSwitch(val);
                              },
                              value: controller.value,
                            ),
                          ),
                    ListTile(
                      onTap: () {
                        controller.goToAddress();
                      },
                      title: const Text("Location"),
                      trailing: const Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                    ),
                    const ListTile(
                      title: Text("about"),
                      trailing: Icon(Icons.question_mark, color: Colors.red),
                    ),
                    ListTile(
                      onTap: () async {
                        await launchUrl(Uri.parse("tel: +02 123655"));
                      },
                      title: const Text("connect us"),
                      trailing: const Icon(Icons.phone_callback_outlined,
                          color: Colors.red),
                    ),
                    ListTile(
                      onTap: () {
                        controller.logOut();
                      },
                      title: const Text("log Out"),
                      trailing: const Icon(Icons.logout, color: Colors.red),
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
