import 'package:flutter/material.dart';

class CustomButtonAddress extends StatelessWidget {
  final Color? color;
  final Color backgroundColor;
  final Widget text;
  final void Function()? onPressed;

  const CustomButtonAddress(
      {super.key,
      this.color,
      required this.text,
      required this.onPressed,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width - 20,
      child: MaterialButton(
        elevation: 1,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: backgroundColor,
            )),
        color: color,
        onPressed: onPressed,
        child: text,
      ),
    );
  }
}
