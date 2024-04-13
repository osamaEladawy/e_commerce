import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/onboarding_controller.dart';
import '../../../core/constant/initialize_color.dart';
import '../../../data/data_source/static_data/stayic.dart';

class CustomDotController extends StatelessWidget {
  const CustomDotController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingcontrollerImp>(builder: (controller)=> Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(onBoardingModelList.length, (index){
          return AnimatedContainer(
            height: 6,
            width: controller.currentPage == index ? 20 : 6,
            margin:const EdgeInsets.only(top: 25,left: 3,right: 3),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            duration:const Duration(microseconds: 6000),
          );
        })
      ],
    ),
    );
  }
}
