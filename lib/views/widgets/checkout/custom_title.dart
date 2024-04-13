import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.headline1!.copyWith(
      color: Colors.red,
      fontSize: 18,
    );
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: style,
      ),
    );
  }
}
