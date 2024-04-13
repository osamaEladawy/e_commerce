import 'package:flutter/material.dart';

class CustomContianerImage extends StatelessWidget {
  final String title;
  final String urlImage;
  final bool isColor;

  const CustomContianerImage({super.key, required this.title, required this.urlImage, required this.isColor,});

  @override
  Widget build(BuildContext context) {
    return   Container(
      alignment: Alignment.center,
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        color:isColor ? Colors.red : null ,

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 15,),
          Expanded(
            child: Image.asset(
             urlImage,
              height: 100,
              width: 100,
              color: isColor ? Colors.grey[200] :null,
            ),
          ),
            const SizedBox(
            height: 10,
          ),
           Expanded(
            child:  Text(title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color:isColor ? Colors.grey[200] : Colors.red
              ),
            ),
          ),
        ],
      ),
    );
  }
}
