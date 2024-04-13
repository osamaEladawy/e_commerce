import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/approutes.dart';
import '../../core/localization/localTranslation.dart';
import '../widgets/launguage/custom_luanguage _page.dart';

class LanguagesPage extends GetView<LocalLanguagesController> {
  const LanguagesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1".tr,style: Theme.of(context).textTheme.headline1,),
              const SizedBox(height: 10,),
              CustomLanguagePage(
                onPressed: (){
                controller.changeLanguage("ar");
                Get.toNamed(AppRoutes.onBoarding);
                },
                textInPut: '2'.tr,),
              CustomLanguagePage(
                onPressed: (){
                  controller.changeLanguage("en");
                  Get.toNamed(AppRoutes.onBoarding);
                },
                textInPut: '3'.tr,),
              CustomLanguagePage(
                onPressed: (){
                  controller.changeLanguage(Get.deviceLocale!.languageCode);
                  Get.toNamed(AppRoutes.onBoarding);
                },
                textInPut: "58".tr,),

            ],
          ),
        ),
      ),
    );
  }
}
