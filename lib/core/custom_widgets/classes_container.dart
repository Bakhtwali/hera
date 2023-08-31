import 'package:englishtalkedesktop/core/Constants/constants.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassesContainer extends StatelessWidget {
  final String image;
  final String name;
  final String time;
  final String time2;
  final String callText;
  final String scheduleText;

  final Color sheduleTextColor;
  final VoidCallback onTap;
  ClassesContainer({
    super.key,
    required this.image,
    required this.name,
    required this.time,
    required this.time2,
    required this.callText,
    required this.scheduleText,
    required this.sheduleTextColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 100.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: WhiteColor),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 100.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    bottomLeft: Radius.circular(12.r),
                  ),
                  child: Image.asset(image, fit: BoxFit.fill),
                ),
              ),
              SizedBox(width: 20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      text: name,
                      fontSized: 18.sp,
                      fontWeight: FontWeight.bold),
                  SizedBox(height: 10.h),
                  DecriptionTextRow(
                      text1: callText,
                      text2: scheduleText,
                      color: scheduleText == 'Completed'
                          ? kGreenColor
                          : Color(0xff2E5AAC)),
                  SizedBox(height: 10.h),
                  CustomText(
                    text: time,
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.sp,
                  color: WhiteColor,
                ),
              )
            ],
          )),
    );
  }
}

class DecriptionTextRow extends StatelessWidget {
  final String text1;
  final String text2;
  final Color? color;
  const DecriptionTextRow({
    super.key,
    this.color,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
            text: text1,
            fontSized: 14.sp,
            color: kBlackColor,
            fontWeight: FontWeight.w400),
        SizedBox(width: 4.w),
        CustomText(
            text: "-",
            fontSized: 14.sp,
            color: kBlackColor,
            fontWeight: FontWeight.w400),
        SizedBox(width: 4.w),
        CustomText(
            text: text2,
            fontSized: 14.sp,
            color: color ?? kBlackColor,
            fontWeight: FontWeight.w400),
      ],
    );
  }
}
