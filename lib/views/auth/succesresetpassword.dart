import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/check for_all_steps _ auth/successresetpassword_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../widgets/login_widgets/custom_action_button.dart';
import '../widgets/login_widgets/custom_text_body.dart';
import '../widgets/login_widgets/custom_text_ttitle.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SuccessResetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 250,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextTitle(text: "56".tr),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextbody(text: "43".tr),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: CustomActionButton(
                        text: Text(
                          "44".tr,
                          style: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          controller.goToLogin();
                        },
                        backgroundColor: Colors.orange,
                        color: Colors.deepOrangeAccent[200],
                      ),
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
