import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final Color? color;
  final Color backgroundColor;
  final Widget text;
  final void Function()? onPressed;

  const CustomActionButton({super.key,this.color, required this.text, required this.onPressed, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width - 50,
      child: MaterialButton(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:  BorderSide(
              color: backgroundColor,
            )),
        color: color,
        onPressed:onPressed,
        child: text,
      ),
    );
  }
}
