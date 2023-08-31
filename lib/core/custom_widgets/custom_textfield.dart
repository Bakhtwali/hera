import 'package:englishtalkedesktop/core/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LongTextFieldWidget extends StatelessWidget {
  final hintfontsize;
  final hintTextColor;
  final String hintText;
  final hintTextFontWeight;
  final ontap;
  //final TextEditingController controller;
  final double? width;
  final double? height;
  final Icon? icon;
  final IconData? iconData;
  final VoidCallback? suffixonTap;
  final bool? obsecureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool? readOnly;
  final void Function(String)? onChanged;
  final color;
  const LongTextFieldWidget(
      {super.key,
      this.hintfontsize,
      this.hintTextFontWeight,
      this.hintTextColor,
      this.ontap,
      this.suffixonTap,
      this.color,
      // required this.controller,
      required this.hintText,
      this.obsecureText,
      this.maxLines,
      this.keyboardType,
      this.readOnly,
      this.icon,
      this.height,
      this.width,
      this.onChanged,
      this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 450.w,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: color ?? Colors.transparent,
      ),
      child: TextFormField(
        onTap: ontap,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: BlackColor, // Set the desired text color
        ),
        onChanged: onChanged,
        readOnly: readOnly ?? false,
        obscureText: obsecureText ?? false,
        keyboardType: keyboardType ?? TextInputType.text,
        // controller: controller,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          // filled: true,
          // fillColor: WhiteColor,
          // contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: WhiteColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: WhiteColor,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 2,
            ),
          ),
          hintText: hintText,
          // contentPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.only(left: 12.w, right: 8, top: 19.h),
          // suffixIcon: GestureDetector(
          //   onTap: suffixonTap ?? () {},
          //   child: Icon(
          //     iconData,
          //     color: kgrayColor,
          //     size: 30.sp,
          //   ),
          // ),
          hintStyle: TextStyle(
            fontSize: hintfontsize ?? 14.sp,
            fontWeight: hintTextFontWeight ?? FontWeight.w400,
            fontFamily: 'Atkinson Hyperlegible',
            color: hintTextColor ?? kgrayColor,
          ),
        ),
      ),
    );
  }
}

class SearchTextFieldWidget extends StatelessWidget {
  final String hintText;
  final hintTextColor;
  //final TextEditingController controller;
  final double? width;
  final double? height;
  final Icon? icon;
  final IconData? iconData;
  final VoidCallback? suffixonTap;
  final bool? obsecureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool? readOnly;
  final void Function(String)? onChanged;
  const SearchTextFieldWidget(
      {super.key,
      this.suffixonTap,
      this.hintTextColor,
      // required this.controller,
      required this.hintText,
      this.obsecureText,
      this.maxLines,
      this.keyboardType,
      this.readOnly,
      this.icon,
      this.height,
      this.width,
      this.onChanged,
      this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 380.w,
      height: height ?? 50.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: klightgrayColor,
            blurRadius: 10,
            offset: const Offset(0, 4),
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextFormField(
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: BlackColor, // Set the desired text color
        ),
        onChanged: onChanged,
        readOnly: readOnly ?? false,
        obscureText: obsecureText ?? false,
        keyboardType: keyboardType ?? TextInputType.text,
        // controller: controller,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: WhiteColor,
          // contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.r),
            borderSide: const BorderSide(
              color: WhiteColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.r),
            borderSide: BorderSide(
              color: WhiteColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.r),
            borderSide: const BorderSide(
              color: WhiteColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.r),
            borderSide: const BorderSide(
              color: WhiteColor,
              width: 2,
            ),
          ),
          hintText: hintText,
          contentPadding: EdgeInsets.only(left: 22, right: 8, top: 19.h),
          suffixIcon: GestureDetector(
            onTap: suffixonTap ?? () {},
            child: Icon(
              iconData,
              color: kgrayColor,
              size: 30.sp,
            ),
          ),
          hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: hintTextColor ?? kgrayColor,
          ),
        ),
      ),
    );
  }
}

class AppTextFieldWidget extends StatefulWidget {
  final prefixColor;
  final hintTextColor;
  final borderRaduis;
  final color;
  final ontap;
  final focusnode;
  final String hintText;
  final prefixIcon;
  // final TextEditingController controller;
  final double? width;
  final double? height;
  final Icon? icon;
  final IconData? iconData;
  final VoidCallback? suffixonTap;
  final bool? obsecureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool? readOnly;
  final suffixIcon;
  final onchanged;
  final String? Function(String?)? validator;
  const AppTextFieldWidget(
      {super.key,
      this.prefixColor,
      this.hintTextColor,
      this.borderRaduis,
      this.color,
      this.prefixIcon,
      this.suffixonTap,
      // required this.controller,
      required this.hintText,
      this.obsecureText,
      this.maxLines,
      this.keyboardType,
      this.readOnly,
      this.validator,
      this.icon,
      this.height,
      this.width,
      this.focusnode,
      this.suffixIcon,
      this.ontap,
      this.onchanged,
      this.iconData});

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRaduis ?? 10.r),
        color: widget.color,
      ),
      child: TextField(
        onChanged: widget.onchanged ?? (val) {},
        maxLines: widget.maxLines ?? 1,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: BlackColor, // Set the desired text color
        ),
        onTap: widget.ontap,
        obscureText: widget.obsecureText ?? false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.prefixIcon,
            color: widget.prefixColor ?? kgrayColor,
          ),
          suffixIcon: GestureDetector(
              onTap: widget.suffixonTap ?? () {},
              child: Icon(widget.suffixIcon)),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.hintTextColor ?? kgrayColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          contentPadding: EdgeInsets.only(left: 8, right: 8, top: 16),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
