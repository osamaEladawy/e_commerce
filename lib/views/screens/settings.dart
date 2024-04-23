import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/options/settings_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../../core/constant/assetsImages.dart';
import '../../core/constant/initialize_color.dart';
import '../../core/functions/translate_database.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingControllerImp());
    return GetBuilder<SettingControllerImp>(
      builder: (controller) =>
        Scaffold(
          appBar: AppBar(),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            imageUrl: controller.userPic,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Align(
                                alignment: Alignment.topRight,
                                child: Text("Info")),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(controller.userName),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(controller.userPhone),
                            ),
                            // const Spacer(),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                controller.userEmail,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text("My Favorite"),
                  subtitle: const Text("This is List of yor favourite Items"),
                  trailing: Badge(
                    largeSize: 20,
                    backgroundColor: Colors.black,
                    label: Text(
                      controller.itemsCountInFav.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    child: IconButton(
                      onPressed: () {
                        controller.goToFavouritePage();
                      },
                      icon: Icon(Icons.favorite,
                          color: controller.itemsCountInFav == 0
                              ? Colors.grey
                              : Colors.red),
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                  imageUrl:
                                      "${AssetsImages.imageItems}/${controller.data[index].itemsImages}",
                                  height: 100,
                                  width: 100),
                              Text(
                                translateDatabase(
                                    "${controller.data[index].itemsNameAr}",
                                    "${controller.data[index].itemsName}"),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      width: 7,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text("My Cart"),
                  subtitle: const Text("This Items in your cart"),
                  trailing: Badge(
                    largeSize: 20,
                    backgroundColor: Colors.black,
                    label: Text(controller.itemsCountInCart.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    child: IconButton(
                      onPressed: () {
                        controller.goToCartPage();
                      },
                      icon: Icon(Icons.shopping_cart,
                          color: controller.itemsCountInCart == 0
                              ? Colors.grey
                              : Colors.orange),
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.dataCart.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CachedNetworkImage(
                                    imageUrl:
                                        "${AssetsImages.imageItems}/${controller.dataCart[index].itemsImages}",
                                    height: 100,
                                    width: 100),
                                Text(
                                  translateDatabase(
                                      "${controller.dataCart[index].itemsNameAr}",
                                      "${controller.dataCart[index].itemsName}"),
                                ),
                                Text("${controller.dataCart[index].itemsPrice}")
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      width: 7,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                        child: GestureDetector(
                          onTap: () {
                            controller.goToProfile();
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(50)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: CachedNetworkImage(
                                imageUrl: controller.userPic,
                                placeholder: (context, child) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.orange,
                                    ),
                                  );
                                },
                                errorWidget: (context, text, child) {
                                  return const Center(
                                    child: Text("no image"),
                                  );
                                },
                              ),
                            ),
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
                          trailing:
                              Icon(Icons.question_mark, color: Colors.red),
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
        ),
    );
  }
}
