import 'package:flutter/material.dart';

class TitleProduct extends StatelessWidget {
  final String name;
  const TitleProduct({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return   Text(name,
      style: Theme
          .of(context)
          .textTheme
          .headline1,
    );
  }
}
