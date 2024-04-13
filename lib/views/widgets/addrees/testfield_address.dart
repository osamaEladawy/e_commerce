import 'package:flutter/material.dart';

class CustomTextFieldAddress extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? label;
  final Widget? suffixIcon;

  const CustomTextFieldAddress(
      {super.key,
      required this.controller,
     required this.hintText,
      this.keyboardType,
       this.prefixIcon,
      this.prefixText,
      required this.label,
        required this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
       if(value!.isEmpty){
         return "please enter the information";
       }
     
      },
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintMaxLines: 5,
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        prefixStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
        labelStyle: TextStyle(
          color: Colors.grey[500],
        ),
        hintText: hintText,
        label: label,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.black45,
            )),
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      ),
    );
  }
}
