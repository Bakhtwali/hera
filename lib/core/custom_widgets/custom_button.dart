import 'package:englishtalkedesktop/core/Constants/constants.dart';
import 'package:englishtalkedesktop/core/custom_widgets/SizedBox.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final ontap;
  final backgroungColor;
  final borderColor;
  final text;
  final height;
  final textColor;
  final Fontweight;
  final width;
  CustomButton(
      {super.key,
      this.width,
      this.backgroungColor,
      this.borderColor,
      this.text,
      this.height,
      this.textColor,
      this.Fontweight,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height ?? 50.h,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: backgroungColor ?? kAmberColor,
            border: Border.all(color: borderColor)),
        child: Center(
          child: CustomText(
            text: text,
            fontWeight: Fontweight ?? FontWeight.w400,
            color: textColor ?? WhiteColor,
          ),
        ),
      ),
    );
  }
}

class buttonWithTextAndImage extends StatelessWidget {
  final image;
  final text;
  final backgroundColor;
  final borderColor;
  final ontap;
  buttonWithTextAndImage(
      {super.key,
      this.image,
      this.text,
      this.backgroundColor,
      this.borderColor,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 55.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            color: backgroundColor ?? kAmberColor,
            border: Border.all(color: borderColor ?? kAmberColor)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 30.h,
                width: 30.w,
              ),
              CustomSizedBox(
                width: 15.w,
              ),
              CustomText(
                text: text,
                fontSized: 15.sp,
                color: BlackColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
