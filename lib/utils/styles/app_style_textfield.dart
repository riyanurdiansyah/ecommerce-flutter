import 'package:ecommerce_flutter/utils/styles/app_color.dart';
import 'package:flutter/material.dart';

class AppStyleTextfield {
  static authTextFieldStyle(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
    );
  }

  static authFormInput(String labelText, String hintText, double fontSize) {
    return InputDecoration(
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      labelText: labelText,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(5)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(5)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(5)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.circular(5)),
    );
  }

  InputDecoration kAuthTextFormInputDecoration(
      String labelText, double fontSize) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      labelText: labelText,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(5)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(5)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(5)),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black38,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
