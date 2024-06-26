import 'package:flutter/material.dart';

class CustomCardChoose extends StatelessWidget {
  final String title;

  final String content;
  final bool isCheck;

  const CustomCardChoose(
      {super.key,
      required this.title,
      required this.content,
      required this.isCheck});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isCheck ? Colors.red : Colors.grey[200],
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: isCheck == true ? Colors.red : Colors.white,
          )),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: isCheck ? Colors.white : Colors.red,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              content,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: isCheck ? Colors.white : Colors.red,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
