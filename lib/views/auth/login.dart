import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth/login_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../../core/constant/assetsImages.dart';
import '../../core/functions/exit_daialog.dart';
import '../../core/functions/validate.dart';
import '../widgets/login_widgets/custom)textformfieled.dart';
import '../widgets/login_widgets/custom_action_button.dart';
import '../widgets/login_widgets/custom_navigation.dart';
import '../widgets/login_widgets/custom_text_body.dart';
import '../widgets/login_widgets/custom_text_ttitle.dart';
import '../widgets/login_widgets/other_away_login.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CostomNavigationToScreens(
        onTap: () {
          controller.goToSignup();
        },
        text1: "22".tr,
        text2: "23".tr,
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "13".tr,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            // ignore: deprecated_member_use
            widget: WillPopScope(
              onWillPop: exitDialog,
              child: ListView(
                children: [
                  Image.asset(
                    AssetsImages.imageCart,
                    height: 200,
                    width: 400,
                  ),
                  const SizedBox(height: 30),
                  CustomTextTitle(text: "14".tr),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextbody(
                    text: "15".tr,
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
                              return validateInput(value!, 5, 100, "email");
                            },
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.email_outlined,
                              ),
                            ),
                            controller: controller.email,
                            hintText: '18'.tr,
                            labeltext: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                '16'.tr,
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        CostomTextFormFieled(
                          validator: (value) {
                            return validateInput(value!, 4, 15, "password");
                          },
                          obscureText: controller.isShowingPassword,
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.showAndHiddinPassword();
                            },
                            icon: const Icon(
                              Icons.lock_outline,
                            ),
                            highlightColor: Colors.purple[100],
                          ),
                          controller: controller.password,
                          hintText: '19'.tr,
                          labeltext: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              '17'.tr,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              controller.goToForgetPassword();
                            },
                            child: Text(
                              "20".tr,
                              style: TextStyle(color: Colors.grey[500]),
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
                            "21".tr,
                            style: const TextStyle(color: Colors.white70),
                          ),
                          onPressed: () {
                            controller.login();
                          },
                        ),
                        const SizedBox(height: 20),
                        const OthersAwayLogin(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
