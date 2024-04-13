import 'package:flutter/material.dart';

class CustomTextbody extends StatelessWidget {
  final String text;
  const CustomTextbody({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Text(text,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(color: Colors.grey[500]),
    );
  }
}
