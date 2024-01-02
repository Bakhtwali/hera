import 'package:englishtalkedesktop/core/Constants/constants.dart';
import 'package:englishtalkedesktop/core/Constants/images.dart';
import 'package:englishtalkedesktop/core/custom_widgets/SizedBox.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_button.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_text.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
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
                    SizedBox()
                    // Image.asset(
                    //   rightCircle,
                    //   height: 700.sp,
                    // )
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/hera-final.png',
                      height: 200.h,
                      width: 200.w,
                    ),
                    Image.asset(
                      EnglishTalke,
                      width: 200.w,
                    ),
                    CustomSizedBox(height: 70.h),
                    CustomText(text: 'Admin Sign In', fontSized: 35.sp),
                    CustomSizedBox(height: 60.h),
                    Container(
                      width: 500.w,
                      child: AppTextFieldWidget(
                        onchanged: (email) {
                          // model.email = email;
                        },
                        hintText: 'Email',
                        prefixIcon: Icons.email,
                      ),
                    ),
                    CustomSizedBox(height: 40.sp),
                    Container(
                      width: 500.w,
                      child: AppTextFieldWidget(
                        obsecureText: true,
                        onchanged: (password) {
                          // model.password = password;
                        },
                        hintText: 'Password',
                        prefixIcon: Icons.lock,
                      ),
                    ),
                    CustomSizedBox(height: 20.sp),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const EmailScreen()),
                        // );
                      },
                      child: CustomText(
                        text: 'Forgot Password?',
                        fontSized: 20.sp,
                      ),
                    ),
                    CustomSizedBox(height: 20.sp),
                    // model.isloading
                    //     ? Center(
                    //         child: CircularProgressIndicator(
                    //             color: kAmberColor))
                    //     :
                    Container(
                      width: 500.w,
                      child: CustomButton(
                        ontap: () {
                          // model.checkAdminCredentials(context);
                          //
                        },
                        text: 'Sign In',
                        backgroungColor: kAmberColor,
                        borderColor: kAmberColor,
                        textColor: WhiteColor,
                      ),
                    ),
                    CustomSizedBox(height: 20.sp),
                  ],
                ),
                Column(
                  children: [
                    SizedBox()
                    // Image.asset(
                    //   leftCircle,
                    //   height: 700.sp,
                    // )
                  ],
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
