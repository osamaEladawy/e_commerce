import 'package:flutter/material.dart';

class CostomNavigationToScreens extends StatelessWidget {
  final void Function()? onTap;
  final String text1;
  final String text2;

  const CostomNavigationToScreens(
      {super.key,
      required this.onTap, required this.text1, required this.text2,
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text1,style: TextStyle(
              color: Colors.grey[500],
            ),),
            const SizedBox(width: 12,),
            Text(text2, style: TextStyle(
                color: Colors.deepOrangeAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 16),),
          ],
        ),
      ),
    );
  }
}
