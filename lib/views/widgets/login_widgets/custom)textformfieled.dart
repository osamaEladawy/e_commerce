import 'package:flutter/material.dart';

class CostomTextFormFieled extends StatelessWidget {
  final String hintText;
  final Widget labeltext;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final String? Function(String?)? validator ;
 final TextInputType? keyboardType;
 final String? prefixText;
 final bool? obscureText;
 final void Function()? onTap;
 final Widget? prefixIcon;

  const CostomTextFormFieled(
      {super.key,
      required this.hintText,
      required this.labeltext,
      required this.controller,
       this.suffixIcon,
      required this.validator,
        this.keyboardType,
        this.prefixText,
         this.obscureText,
        this.onTap,
        this.prefixIcon,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
         obscureText: obscureText == null || obscureText == false ? false : true,
         validator:validator,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          hintMaxLines: 5,
          prefixIcon: prefixIcon,
          prefixText: prefixText,
          prefixStyle:const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
          labelStyle: TextStyle(
            color: Colors.grey[500],
          ),
          hintText: hintText,
          label: labeltext,
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
      ),
    );
  }
}
