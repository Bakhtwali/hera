import 'package:englishtalkedesktop/core/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final alignment;
  final String text;
  final color;
  final fontSized;
  final fontWeight;
  const CustomText(
      {this.alignment,
      required this.text,
      this.color,
      this.fontSized,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment ?? TextAlign.start,
      style: TextStyle(
          color: color ?? BlackColor,
          fontSize: fontSized ?? 18.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontFamily: 'calibri'),
    );
  }
}
