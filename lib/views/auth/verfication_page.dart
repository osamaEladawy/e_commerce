import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../controller/check for_all_steps _ auth/verfication_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../widgets/login_widgets/custom_text_body.dart';
import '../widgets/login_widgets/custom_text_ttitle.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VervicationControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "39".tr,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<VervicationControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: controller.formSatate,
                child: Column(
                  children: [
                    CustomTextTitle(text: "40".tr),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextbody(
                      text: "41".tr,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OtpTextField(
                      borderRadius: BorderRadius.circular(20),
                      fieldWidth: 50,
                      numberOfFields: 5,
                      borderColor: const Color(0xFF512DA8),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        controller.checkCode(verificationCode);
                      }, // end onSubmit
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
