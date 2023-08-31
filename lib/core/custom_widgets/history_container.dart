import 'package:englishtalkedesktop/core/Constants/constants.dart';
import 'package:englishtalkedesktop/core/custom_widgets/classes_container.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryContainer extends StatelessWidget {
  final String image;
  final String name;
  final String time;
  final String time2;
  final String callText;
  final String scheduleText;

  final Color sheduleTextColor;
  final VoidCallback onTap;
  HistoryContainer({
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
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 10.h),
                  DecriptionTextRow(
                      text1: callText,
                      text2: scheduleText,
                      color: scheduleText == 'Completed'
                          ? kGreenColor
                          : Color(0xff2E5AAC)),
                  SizedBox(height: 10.h),
                  DecriptionTextRow(
                    text1: time,
                    text2: time2,
                    color: kBlackColor,
                  )
                ],
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.sp,
                  color: BlackColor,
                ),
              )
            ],
          )),
    );
  
  
  }
}
