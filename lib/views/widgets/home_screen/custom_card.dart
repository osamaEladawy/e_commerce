import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/all_home_controller/homepage_controller.dart';
import '../../../core/constant/initialize_color.dart';

class CustomCard extends GetView<HomePageControllerImp> {
  final String text1;
  final String text2;
  const CustomCard({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return    Container(
      //margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color:AppColors.primaryColor,
      ),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text1,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  text2,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          Positioned(
            right:controller.lang == "en" ? -5 : -5,
            top: -5,
            left: controller.lang == "ar" ? -5 : null,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: const Color(0xffe67e22),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
