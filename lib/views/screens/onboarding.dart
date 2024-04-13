import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth/onboarding_controller.dart';
import '../widgets/ondoarding/customdotcontroller.dart';
import '../widgets/ondoarding/custommybutton.dart';
import '../widgets/ondoarding/custompageonboarding.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});


  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingcontrollerImp());
    return const Scaffold(
      backgroundColor: Colors.white,
     body: SafeArea(
       child: Column(
         children: [
           Expanded(
             flex: 3,
             child: CustomPageOnBoarding(),
           ),
           Expanded(
             flex: 1,
             child: Column(
               children: [
                 CustomDotController(),
                 Spacer(),
                 CustomMyButton(),
               ],
             ),
           ),
         ],
       )
     ),
    );
  }
}
