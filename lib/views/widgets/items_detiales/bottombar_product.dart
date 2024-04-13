import 'package:flutter/material.dart';

import '../../items/items_detiales.dart';

class CustomBottomBar extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const CustomBottomBar({super.key, required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xff192a56),
          borderRadius: BorderRadius.circular(15),
        ),
        height: 45,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(title, style: style1, textAlign: TextAlign.center,),
      ),
    );
  }
}
