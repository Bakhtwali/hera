// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final onChanged, validator, fillColor, initialVal, obscureText, keyBoardType;
  IconButton? suffixIcon;
  CustomTextField(
      {super.key,
      this.onChanged,
      this.validator,
      this.fillColor,
      this.suffixIcon,
      this.keyBoardType,
      this.obscureText = false,
      this.initialVal});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF554279), width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        initialValue: initialVal,
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyBoardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 12),
          suffixIcon: suffixIcon,
          filled: fillColor,
          fillColor: Colors.white,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
