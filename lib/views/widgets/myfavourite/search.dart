import 'package:flutter/material.dart';


class CustomTextFieldScreenFavourite extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController controller;
  final void Function()? onPressedIconSearch;
  final Function(String)? onChanged;
  final Key? keyForm;

  const CustomTextFieldScreenFavourite(
      {super.key,
        required this.hintText,
        required this.label,
        this.onPressedIconSearch,
        required this.controller,
        required this.onChanged,
        required this.keyForm,
      });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyForm,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: TextFormField(
                controller: controller,
                onChanged: onChanged,
                validator: (String? value) {
                  if(value!.isEmpty){
                    return "this field must not be empty";
                  }
                },
                decoration: InputDecoration(
                  hintText: hintText,
                  labelText: label,
                  prefixIcon: IconButton(
                    onPressed: onPressedIconSearch,
                    icon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey.shade50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey.shade50),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
