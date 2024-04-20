import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/options/myfavourite_controller.dart';

class CustomTextFieldScreenHome extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController controller;
  final void Function()? onPressedIconSearch;
  final void Function()? onPressedNotification;
  final void Function()? onPressedFavourite;
  final Function(String)? onChanged;
  final Key? keyForm;

  //final String? Function(String?)? validator;

  const CustomTextFieldScreenHome({
    super.key,
    required this.hintText,
    required this.label,
    this.onPressedIconSearch,
    this.onPressedNotification,
    required this.onPressedFavourite,
    required this.controller,
    required this.onChanged,
    required this.keyForm,
    //required this.validator
  });

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoritesController());
    return Form(
      key: keyForm,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: TextFormField(
                controller: controller,
                onChanged: onChanged,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "this field must not be empty";
                  }
                },
                decoration: InputDecoration(
                  hintText: hintText,
                  labelText: label,
                  prefixIcon: IconButton(
                    onPressed: onPressedIconSearch,
                    icon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey.shade50),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 60,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: IconButton(
              onPressed: onPressedNotification,
              icon: Icon(
                Icons.notifications_active_outlined,
                color: Colors.grey[600],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: 60,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: IconButton(
              onPressed: onPressedFavourite,
              icon: Icon(
                Icons.favorite,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
