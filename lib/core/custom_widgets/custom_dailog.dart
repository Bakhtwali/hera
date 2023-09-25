import 'dart:ui';
import 'package:englishtalkedesktop/core/Constants/constants.dart';
import 'package:englishtalkedesktop/core/custom_widgets/SizedBox.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_button.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customdailog extends StatelessWidget {
  final ontap;
  final picture;
  final text;
  final subtext;
  final buttonText;
  Customdailog(
      {this.picture, this.text, this.subtext, this.buttonText, this.ontap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            picture,
            height: 150.h,
            width: 150.w,
          ), // Replace with your image asset path
          SizedBox(height: 16.h),

          CustomText(
            text: text,
            fontSized: 24.sp,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 8),

          CustomText(
            text: subtext,
          ),
          CustomSizedBox(
            height: 32.h,
          ),
          CustomButton(
            ontap: ontap ?? () {},
            text: buttonText,
            textColor: WhiteColor,
            borderColor: kAmberColor,
            backgroungColor: kAmberColor,
          )
        ],
      ),
    );
  }
}

class CustomCallDailog extends StatelessWidget {
  final ontap;
  final picture;
  final text;
  final subtext;
  final buttonText;
  final button2text;
  final OnTap2;
  CustomCallDailog(
      {this.picture,
      this.text,
      this.subtext,
      this.buttonText,
      this.ontap,
      this.button2text,
      this.OnTap2});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 113.h,
            width: 110.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.r), color: kAmberColor),
            child: Center(
                child: Icon(
              picture,
              size: 50.sp,
              color: WhiteColor,
            )),
          ),
          // Replace with your image asset path
          SizedBox(height: 16.h),

          CustomText(
            text: text,
            fontSized: 24.sp,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 17.h),

          CustomText(
            text: subtext,
            fontSized: 16.sp,
          ),
          CustomSizedBox(
            height: 32.h,
          ),
          CustomButton(
            ontap: ontap ?? () {},
            text: buttonText,
            textColor: WhiteColor,
            borderColor: kAmberColor,
            backgroungColor: kAmberColor,
          ),
          CustomSizedBox(
            height: 17.h,
          ),
          CustomButton(
            ontap: OnTap2 ?? () {},
            text: button2text,
            textColor: WhiteColor,
            borderColor: kgrayColor.withOpacity(.8),
            backgroungColor: kgrayColor.withOpacity(.8),
          ),
        ],
      ),
    );
  }
}
