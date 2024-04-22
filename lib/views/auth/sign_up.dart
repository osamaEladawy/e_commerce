// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../controller/auth/sign_up_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../../core/functions/exit_daialog.dart';
import '../../core/functions/validate.dart';
import '../widgets/login_widgets/custom)textformfieled.dart';
import '../widgets/login_widgets/custom_action_button.dart';
import '../widgets/login_widgets/custom_navigation.dart';
import '../widgets/login_widgets/custom_text_body.dart';
import '../widgets/login_widgets/custom_text_ttitle.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controllerImp = Get.put(SignUpControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CostomNavigationToScreens(
        onTap: () {
          controllerImp.goToLogin();
        },
        text1: "37".tr,
        text2: "38".tr,
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Container(
          margin: const EdgeInsets.only(top: 25),
          child: Text(
            "25".tr,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: WillPopScope(
              onWillPop: exitDialog,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextTitle(text: "26".tr),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextbody(
                      text: "27".tr,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        controller.uploadMyImage();
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.deepOrangeAccent[200],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: controller.file != null
                              ? Image.file(
                                  controller.file!,
                                  fit: BoxFit.cover,
                                )
                              : controller.url != null ||
                                      controller.url!.isNotEmpty
                                  ? CachedNetworkImage(
                                      imageUrl: controller.url!)
                                  : null,
                        ),
                      ),
                    ),
                    Text(
                      "Select Image",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.grey[500]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: controller.formState,
                      child: Column(
                        children: [
                          CostomTextFormFieled(
                            validator: (value) {
                              return validateInput(value!, 3, 15, "username");
                            },
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.person,
                              ),
                            ),
                            controller: controller.username,
                            hintText: '35'.tr,
                            labeltext: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                '32'.tr,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CostomTextFormFieled(
                            validator: (value) {
                              return validateInput(value!, 5, 100, "email");
                            },
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.email_outlined,
                              ),
                            ),
                            controller: controller.email,
                            hintText: '30'.tr,
                            labeltext: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                '28'.tr,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CostomTextFormFieled(
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              return validateInput(value!, 11, 11, "phone");
                            },
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.phone,
                              ),
                            ),
                            // prefixText: "+20  ",
                            controller: controller.phone,
                            hintText: '34'.tr,
                            labeltext: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                '33'.tr,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CostomTextFormFieled(
                            validator: (value) {
                              return validateInput(value!, 5, 20, "password");
                            },
                            obscureText: controller.isShowingPassword,
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.showAndHiddenPass();
                              },
                              icon: Icon(
                                Icons.visibility,
                                color: !controller.isShowingPassword
                                    ? Colors.blue
                                    : null,
                              ),
                            ),
                            controller: controller.password,
                            hintText: '31'.tr,
                            labeltext: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                '29'.tr,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomActionButton(
                            backgroundColor: Colors.orange,
                            color: Colors.deepOrangeAccent[200],
                            text: Text(
                              "36".tr,
                              style: const TextStyle(color: Colors.white70),
                            ),
                            onPressed: controller.signUp,
                          ),
                        ],
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
