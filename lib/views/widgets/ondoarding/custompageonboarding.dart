import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/onboarding_controller.dart';
import '../../../core/constant/assetsImages.dart';
import '../../../core/constant/initialize_color.dart';
import '../../../data/model/onboardindmodel.dart';

class CustomPageOnBoarding extends GetView<OnBoardingcontrollerImp> {
  const CustomPageOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> onBoardingModelList = [
      OnBoardingModel(
          title: '8'.tr,
          image: AssetsImages.image1,
          body: "4".tr),
      OnBoardingModel(
          title: "9".tr,
          image: AssetsImages.image2,
          body: "5".tr),
      OnBoardingModel(
          title: "10".tr,
          image: AssetsImages.image3,
          body: "6".tr),
      OnBoardingModel(
          title: "11".tr,
          image: AssetsImages.image4,
          body: "7".tr),
    ];
    return PageView.builder(
      controller: controller.pageController,

      //this function returns the numbers screen when navigation,
      onPageChanged: (index){
       controller.changePage(index);
      },
        itemCount: onBoardingModelList.length,
        itemBuilder: (context,index){
          return Column(
            children: [
              const SizedBox(height: 60,),
              Text("${onBoardingModelList[index].title}",
                  style:const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColors.colorTitle),
              ),
              const SizedBox(height: 50,),
              Image.asset("${onBoardingModelList[index].image}",
                height: Get.width / 1.5 ,
                fit:BoxFit.fill,
              ),
              const SizedBox(height: 20,),
              Text("${onBoardingModelList[index].body}",
                textAlign: TextAlign.center,
                style:const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.color,
                    height: 1.7),
              ),
            ],
          );
        });
  }
}
