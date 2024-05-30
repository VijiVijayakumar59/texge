import 'package:flutter/material.dart';
import 'package:texge/utils/color/colors.dart';

class TextFormWidget extends StatelessWidget {
  final String label;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  const TextFormWidget({super.key, required this.label, this.textInputType, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        style: TextStyle(color: whiteColor),
        validator: validator,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              color: Color.fromARGB(255, 195, 195, 195),
            )),
        keyboardType: textInputType);
  }
}
