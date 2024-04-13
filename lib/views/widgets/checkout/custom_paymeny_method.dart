import 'package:flutter/material.dart';

class CustomPayment extends StatelessWidget {
  final String title;
  final bool isPayment;
  const CustomPayment({super.key, required this.title, required this.isPayment});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(7),
      height: 40,
      decoration: BoxDecoration(
          color:isPayment ? Colors.red : Colors.red[200],
          borderRadius: BorderRadius.circular(20)),
      child:  Text(
        title,
        style: TextStyle(
          color:isPayment ? Colors.white : Colors.red[400],
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
