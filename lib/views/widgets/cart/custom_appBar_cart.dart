import 'package:flutter/material.dart';

class CustomAppBarCart extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomAppBarCart({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              alignment: Alignment.centerLeft,
              child:IconButton(
                onPressed: onPressed,
                icon:  const Icon(
                  Icons.arrow_back_ios,
                ),
              )
            ),
          ),
            Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
