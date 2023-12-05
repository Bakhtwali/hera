import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customdailog extends StatelessWidget {
  final ontap2;
  final btn2text;
  final ontap;
  final picture;
  final text;
  final subtext;
  final btncolor;
  final buttonText;
  Customdailog(
      {
      this.ontap2,
      this.picture,
      this.text,
      this.btn2text,
      this.subtext,
      this.btncolor,
      this.buttonText,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
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
          SizedBox(
            height: 32.h,
          ),
          CustomButton(
            ontap: ontap ?? () {},
            text: buttonText,
            textColor: Colors.white,
            borderColor: btncolor,
            backgroungColor: btncolor,
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 120.w),
            child: CustomButton(
              ontap: ontap2 ?? () {},
              text: btn2text,
              textColor: Color(0xff35414F),
              // borderColor: KGrayColorForDashboard.withOpacity(.3),
              // backgroungColor: KGrayColorForDashboard.withOpacity(.3),
            ),
          ),
        ],
      ),
    );
  }
}
class CustomButton extends StatelessWidget {
  final ontap;
  final backgroungColor;
  final borderColor;
  final text;
  final height;
  final textColor;
  final Fontweight;
  CustomButton(
      {
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
        height: height ?? 55.h,
        // width: 324.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            // color: backgroungColor ?? kAmberColor,
            border: Border.all(color: borderColor)),
        child: Center(
          child: CustomText(
            text: text,
            fontWeight: Fontweight ?? FontWeight.w400,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final maxline;
  final alignment;
  final String text;
  final color;
  final fontSized;
  final fontWeight;
  const CustomText(
      {
      this.maxline,
      this.alignment,
      required this.text,
      this.color,
      this.fontSized,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment ?? TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines:maxline?? 2,
      style: TextStyle(
          color: color ?? Colors.black,
          fontSize: fontSized ?? 18.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontFamily: 'Segoe UI'),
    );
  }
}