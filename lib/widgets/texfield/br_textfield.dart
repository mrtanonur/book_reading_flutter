import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:book_reading_flutter/utils/constants/color_constants.dart';

class BRTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int? maxLines;

  const BRTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return TextField(
          maxLines: maxLines,
          controller: controller,
          autocorrect: false,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                  color: ColorConstants.lightGrey, fontWeight: FontWeight.w300),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: ColorConstants.lightGrey),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: ColorConstants.accent),
                  borderRadius: BorderRadius.circular(10))));
    } else {
      return CupertinoTextField(
        controller: controller,
        maxLines: maxLines,
        placeholder: hintText,
        autocorrect: false,
        keyboardType: TextInputType.text,
      );
    }
  }
}
