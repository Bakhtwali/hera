import 'package:englishtalkedesktop/core/Constants/constants.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarContainer extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;
  final double? width;
  const TabBarContainer({
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 45.h,
        width: width ?? 184.w,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: kAmberColor, width: 2)),
        child: Center(
          child: CustomText(
            text: text,
            fontSized: 18.sp,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
