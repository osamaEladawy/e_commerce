import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/check for_all_steps _ auth/resetpassword_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../../core/functions/validate.dart';
import '../widgets/login_widgets/custom)textformfieled.dart';
import '../widgets/login_widgets/custom_action_button.dart';
import '../widgets/login_widgets/custom_text_body.dart';
import '../widgets/login_widgets/custom_text_ttitle.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "50".tr,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: controller.formstate,
                child: Column(
                  children: [
                    CustomTextTitle(text: "50".tr),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextbody(text: "51".tr),
                    const SizedBox(
                      height: 20,
                    ),
                    CostomTextFormFieled(
                      validator: (value) {
                        return validateInput(value!, 5, 20, "password");
                      },
                      onTap: () {
                        controller.showAndHiddenPassOne();
                      },
                      obscureText: controller.isShowingPassword1,
                      controller: controller.password,
                      hintText: '53'.tr,
                      labeltext: Text(
                        "52".tr,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon:const Icon(
                          Icons.lock_outline,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CostomTextFormFieled(
                      validator: (value) {
                        return validateInput(value!, 5, 20, "password");
                      },
                      onTap: () {
                        controller.showAndHiddenPassOne();
                      },
                      obscureText: controller.isShowingPassword1,
                      controller: controller.confirmPassword,
                      hintText: '54'.tr,
                      labeltext: Text(
                        "52".tr,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon:const Icon(
                          Icons.lock_outline,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomActionButton(
                      text: Text(
                        "55".tr,
                        style: const TextStyle(color: Colors.white70),
                      ),
                      onPressed: () {
                        controller.goToSuccessToResetPassword();
                      },
                      color: Colors.deepOrangeAccent[200],
                      backgroundColor: Colors.orange,
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
