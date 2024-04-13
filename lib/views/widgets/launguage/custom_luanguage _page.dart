import 'package:flutter/material.dart';

class CustomLanguagePage extends StatelessWidget {
  final String textInPut;
  final  void Function()? onPressed;
  const CustomLanguagePage({super.key, required this.textInPut, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: MaterialButton(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide:const BorderSide(
              color: Colors.orange,
            ),
          ),
          color: Colors.orange,
          onPressed: onPressed,
          child: Text(textInPut,style:Theme.of(context).textTheme.headline1,
          ),
      ),
    );
  }
}
