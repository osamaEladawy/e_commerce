import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';

class OthersAwayLogin extends GetView<LoginControllerImp> {
  const OthersAwayLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return  ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        IconButton(
            color: Colors.red,
            onPressed: () {
              controller.loginWithGoogle();
            },
            icon: const Icon(
              FontAwesomeIcons.google,
            )),
        IconButton(
            color: Colors.blue,
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.facebook)),
        IconButton(
            color: Colors.blue,
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.twitter,
            )),
      ],
    );
  }
}
