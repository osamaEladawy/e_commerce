import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../controller/auth/verficationsignup_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../widgets/login_widgets/custom_text_body.dart';
import '../widgets/login_widgets/custom_text_ttitle.dart';

class VerficationSignUp extends StatelessWidget {
  const VerficationSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerficationSignUpControllerImp());
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
        child: GetBuilder<VerficationSignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: [
                    CustomTextTitle(text: "40".tr),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextbody(
                      text:
                      //"41".tr,
                      """Enter the code, it is sent to the your email \n ${controller.email}
                       """,
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
                        controller.gotoSuccessSignUp(verificationCode);
                      }, // end onSubmit
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Resend Code",style: Theme.of(context).textTheme.bodyText1,),
                        IconButton(onPressed: (){
                          controller.resendVerficationCode();
                        }, icon:const Icon(Icons.send,size: 18,))
                      ],
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
