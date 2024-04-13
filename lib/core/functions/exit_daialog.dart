import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

//to used show dialog for user when him want exit login page or sign up page,

Future<bool>exitDialog(){
   Get.defaultDialog(
     backgroundColor: Colors.grey[250],
     barrierDismissible: false,
    title: "Important",
    content:const Text("Are you want to exit the application"),
    actions: [
      ElevatedButton(
          onPressed: (){
            Get.back();
          },
          child: const Text("cancel"),
      ),
      const SizedBox(height: 20,),
      ElevatedButton(
          onPressed: (){
            exit(0);
          },
          child: const Text("yes"),
      ),
    ]
  );
   return Future.value(true);
}