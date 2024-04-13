import 'package:flutter/material.dart';

import '../../../core/constant/teststyle.dart';

class CustomTitleCart extends StatelessWidget {
  final String message ;
  const CustomTitleCart({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 20),
      //padding:const EdgeInsets.only(bottom: 10,top: 10),
      alignment: Alignment.center,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.orange.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(message,textAlign: TextAlign.center,style:Style.textStyle),
    );
  }
}
