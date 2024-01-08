// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:englishtalkedesktop/Ui/custom_widget/custom_dailog/delet_dailog.dart';
import 'package:englishtalkedesktop/Ui/screens/question_configuration/questionare_peovider.dart';
import 'package:englishtalkedesktop/Ui/screens/question_configuration/new_question_screen/new_question_screen.dart';
import 'package:englishtalkedesktop/Ui/screens/question_configuration/show_all_question/show_all_question.dart';
import 'package:englishtalkedesktop/Ui/screens/side_bar.dart';
import 'package:englishtalkedesktop/core/custom_widgets/SizedBox.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Questionare extends StatelessWidget {
  const Questionare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuestionareProvider(),
      child: Consumer<QuestionareProvider>(
        builder: (context, model, child) => Scaffold(
            body: Row(
          children: [
            SideBar(),
            Expanded(
                child: Column(
              children: [
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Container(
                    height: 119.h,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 0,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.r))),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              model.changeActive(1);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    // Image.asset(
                                    //   clock,
                                    //   width: 50.w,
                                    //   height: 50.h,
                                    // ),
                                    CustomSizedBox(width: 30.w),
                                    CustomText(
                                      text: 'Add New Question',
                                      fontSized: 24.sp,
                                      color: model.isActive
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  ],
                                ),
                                CustomSizedBox(height: 30.h),
                                Padding(
                                  padding: EdgeInsets.only(left: 50.w),
                                  child: Container(
                                    width: 270.w,
                                    height: 5.h,
                                    decoration: BoxDecoration(
                                        color: model.isActive
                                            ? Colors.teal
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.r))),
                                  ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              model.changeActive(2);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    // Image.asset(
                                    //   tick,
                                    //   width: 50.w,
                                    //   height: 50.h,
                                    // ),
                                    CustomSizedBox(width: 30.w),
                                    CustomText(
                                      text: 'View All Question',
                                      fontSized: 24.sp,
                                      color: model.isActive
                                          ? Colors.grey
                                          : Colors.black,
                                    ),
                                  ],
                                ),
                                CustomSizedBox(height: 30.h),
                                Padding(
                                  padding: EdgeInsets.only(left: 80.w),
                                  child: Container(
                                    width: 290.w,
                                    height: 5.h,
                                    decoration: BoxDecoration(
                                        color: model.isActive
                                            ? Colors.transparent
                                            : Colors.teal,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.r))),
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                  ),
                ),
                CustomSizedBox(height: 40.h),
                model.isActive ? NewQuestionScreen() : ShowAllQuestion()
              ],
            )),
          ],
        )),
      ),
    );
  }
}
