import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/onboarding_controller.dart';
import '../../../core/constant/initialize_color.dart';

class CustomMyButton extends GetView<OnBoardingcontrollerImp> {
  const CustomMyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const EdgeInsets.only(bottom: 80),
    height: 40,
      width: MediaQuery.of(context).size.width - 130,
      decoration: const BoxDecoration(
      ),
      child: MaterialButton(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            )
        ),
        color:AppColors.primaryColor,
        onPressed: (){
          controller.next();
        },
        child:  Text(
           "12".tr
          ,style:const TextStyle(
          color: Colors.white,
        ),),
      ),
    );
  }
}
