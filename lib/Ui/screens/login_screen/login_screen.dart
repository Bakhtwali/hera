import 'package:englishtalkedesktop/Ui/screens/login_screen/login_provider.dart';
import 'package:englishtalkedesktop/core/Constants/constants.dart';
import 'package:englishtalkedesktop/core/Constants/images.dart';
import 'package:englishtalkedesktop/core/custom_widgets/SizedBox.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_button.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_text.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => loginProvider(),
      child: Consumer<loginProvider>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              // color: Colors.amber,
              width: 1.sw,
              child: Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.h, left: 50.w),
                    child: CustomText(
                      text: 'Welcome!',
                      fontSized: 35.sp,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/circle.png',
                          height: 300.sp,
                          color: Colors.teal.withOpacity(.1),
                        ),
                        SizedBox(height: 50.h),
                        Padding(
                          padding: EdgeInsets.only(right: 200.w),
                          child: Image.asset(
                            'assets/left.png',
                            height: 200.h,
                            width: 200.w,
                            color: Colors.teal.withOpacity(.1),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/hera-final.png',
                          height: 200.h,
                          width: 200.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(10.r)),
                          height: 10.h,
                          width: 300.w,
                        ),

                        CustomSizedBox(height: 70.h),
                        CustomText(text: 'Admin Sign In', fontSized: 35.sp),
                        CustomSizedBox(height: 60.h),
                        Container(
                          width: 500.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Colors.white,
                              border: Border.all(color: Colors.teal)),
                          child: AppTextFieldWidget(
                            onchanged: (email) {
                              model.email = email;
                            },
                            hintText: 'Email',
                            prefixIcon: Icons.email,
                          ),
                        ),
                        CustomSizedBox(height: 40.sp),
                        Container(
                          width: 500.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Colors.white,
                              border: Border.all(color: Colors.teal)),
                          child: AppTextFieldWidget(
                            obsecureText: true,
                            onchanged: (password) {
                              model.password = password;
                            },
                            hintText: 'Password',
                            prefixIcon: Icons.lock,
                          ),
                        ),
                        CustomSizedBox(height: 20.sp),
                        // GestureDetector(
                        //   onTap: () {
                        //     // Navigator.push(
                        //     //   context,
                        //     //   MaterialPageRoute(
                        //     //       builder: (context) => const EmailScreen()),
                        //     // );
                        //   },
                        //   child: CustomText(
                        //     text: 'Forgot Password?',
                        //     fontSized: 20.sp,
                        //   ),
                        // ),
                        CustomSizedBox(height: 40.sp),
                        // model.isloading
                        //     ? Center(
                        //         child: CircularProgressIndicator(
                        //             color: kAmberColor))
                        //     :
                        Container(
                          width: 500.w,
                          child: model.isloading
                              ? Center(child: CircularProgressIndicator())
                              : CustomButton(
                                  ontap: () {
                                    model.checkAdminCredentials(context);
                                  },
                                  text: 'Sign In',
                                  backgroungColor: Colors.teal,
                                  borderColor: Colors.teal,
                                  textColor: WhiteColor,
                                ),
                        ),
                        CustomSizedBox(height: 20.sp),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/circle.png',
                          height: 300.sp,
                          color: Colors.teal.withOpacity(.1),
                        ),
                        SizedBox(height: 50.h),
                        Padding(
                          padding: EdgeInsets.only(left: 200.w),
                          child: Image.asset(
                            'assets/right.png',
                            height: 200.h,
                            width: 200.w,
                            color: Colors.teal.withOpacity(.1),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
