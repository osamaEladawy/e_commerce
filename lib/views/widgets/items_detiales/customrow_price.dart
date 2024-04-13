import 'package:flutter/material.dart';
import '../../items/items_detiales.dart';

class CustomPrice extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
  final int count;
  const CustomPrice({super.key,required this.onAdd,required this.onRemove, required this.price, required this.count, });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: onAdd,
              icon: const Icon(
                Icons.add,
                size: 16,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 25,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child:  Text("$count"),
            ),
            IconButton(
              onPressed: onRemove,
              icon: const Icon(
                Icons.remove,
                size: 16,
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          "  $price   ",
          style: style,
        ),
      ],
    );
  }
}
