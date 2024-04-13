import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/check for_all_steps _ auth/forgetpassword_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../../core/functions/validate.dart';
import '../widgets/login_widgets/custom)textformfieled.dart';
import '../widgets/login_widgets/custom_action_button.dart';
import '../widgets/login_widgets/custom_text_body.dart';
import '../widgets/login_widgets/custom_text_ttitle.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "45".tr,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        body: SafeArea(
          child: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: controller.formState,
                  child: Column(
                    children: [
                      CustomTextTitle(text: "46".tr),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextbody(text: "47".tr),
                      const SizedBox(
                        height: 20,
                      ),
                      CostomTextFormFieled(
                        validator: (value) {
                          return validateInput(value!, 5, 100, "email");
                        },
                        controller: controller.email,
                        hintText: '48'.tr,
                        labeltext: Text("45".tr),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon:const Icon(
                            Icons.email,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomActionButton(
                        text: Text(
                          "49".tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.white70),
                        ),
                        onPressed: () {
                          controller.checkEmail();
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
        ));
  }
}
