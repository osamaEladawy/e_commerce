import 'dart:io';

import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:e_commerce_app/core/functions/upload_image.dart';
import 'package:e_commerce_app/data/data_source/data_remote/auth/signup_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../../core/functions/handleStatus_response.dart';

/*it used to delete or clear data from current page when navigation to next page,
      three away to make this,
       Get.delete<SignUpControllerImp>();
       used laztput in current page,
       used bidding
*/
abstract class SignUpController extends GetxController {
  signUp();
  goToLogin();
  goToCheckEmail();
  uploadMyImage();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  SignUpData signUpData = SignUpData(
    curd: Get.find(),
  );
  File? file;
  String? url;

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController username;
  StatusRequest statusRequest = StatusRequest.none;
  bool isShowingPassword = true;

  showAndHiddenPass() {
    isShowingPassword = isShowingPassword == true ? false : true;
    update();
  }

  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  signUp() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(
          username: username.text,
          email: email.text,
          phone: phone.text,
          password: password.text,
          image: "$url");
      print("response controller....................................$response");
      statusRequest = handleStatus(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoutes.verficationSignUp, arguments: {
            'email': email.text,
          });
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Email or Phone Number is already found");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("not valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    username.dispose();
    super.dispose();
  }

  @override
  goToCheckEmail() {
    Get.offNamed(AppRoutes.verficationSignUp);
  }

  @override
  uploadMyImage() async {
    ImagePicker _image = ImagePicker();

    XFile? _file = await _image.pickImage(source: ImageSource.gallery);

    if (_file != null) {
      file = File(_file.path);

      String imageName = basename(_file.name);

      url = await uploadImage("profilePic", imageName, file!);
    } else {
      Get.snackbar("Haye!", "no image avaliable!");
    }
    update();
  }
}
