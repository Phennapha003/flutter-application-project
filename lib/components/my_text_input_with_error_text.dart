// ignore_for_file: unnecessary_import, camel_case_types, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_with_error_text.dart';

class MyTextInputWithErrorText extends StatelessWidget {
  InputWithErrorText input;
  final bool obscureText;
  final String hintText;
  final TextInputType keyboardType;

  MyTextInputWithErrorText({
    super.key,
    required this.input,
    required this.hintText,
    required this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        onChanged: (value) {
          input.valueText = value;
        },
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          errorText: input.errorText,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.blueGrey,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 255, 101, 173)),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
