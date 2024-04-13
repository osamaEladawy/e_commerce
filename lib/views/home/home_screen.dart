import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/all_home_controller/homescreen_controller.dart';
import '../widgets/home_screen/custom_appBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          child: const Icon(Icons.shopping_cart_checkout_outlined),
          onPressed: () {
            controller.goToCart();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.all(10),
          elevation: 0.5,
          height: 64,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          color: Colors.grey[200],
          child: Row(
            children: [
              ...List.generate(controller.pages.length + 1, (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : CustomButtonAppBar(
                        active: controller.currentPage == i ? true : false,
                        onPressed: () {
                          controller.chanPage(i);
                        },
                        icon: controller.words[i]['icon'],
                        text: controller.words[i]['title'],
                      );
              }),
            ],
          ),
        ),
        // ignore: deprecated_member_use
        body: WillPopScope(
          child: controller.pages.elementAt(controller.currentPage),
          onWillPop: () {
            Get.defaultDialog(
                title: "Haye!",
                middleText: "you want to exit the application",
                onCancel: () {},
               onConfirm: (){
                  exit(0);
               });
            return Future.value(false);
          },
        ),
      ),
    );
  }
}
