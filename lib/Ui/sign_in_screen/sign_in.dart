// ignore_for_file: prefer_const_constructors

import 'package:englishtalkedesktop/Ui/dashboard.dart/dashboard_screen.dart';
import 'package:englishtalkedesktop/Ui/sign_in_screen/signin_provider.dart';
import 'package:englishtalkedesktop/core/custom_widgets/cstm_text_field.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../models/enums/view_state.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final checkBoxNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) {
      return SignInProvider();
    }, child: Consumer<SignInProvider>(builder: (context, model, child) {
      return Scaffold(
        backgroundColor: Colors.teal,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 400,
                height: 550,
                // width: MediaQuery.of(context).size.width / 2.5,
                // height: MediaQuery.of(context).size.height / 1.1,
                padding: EdgeInsets.symmetric(horizontal: 50.h),
                margin: EdgeInsets.symmetric(vertical: 50.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color(0xFF554279),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/hera-login.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: "RussoOne",
                          fontWeight: FontWeight.bold),
                    ),

                    Text(
                      "Sign in to stay connected.",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "WorkSans"),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "WorkSans"),
                        ),

                        /// email address field
                        CustomTextField(
                          // onChanged: (value) {
                          //   model?.appUser.userEmail = value;
                          // },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email can't be empty";
                            }
                            if (!value.contains("@")) {
                              return "Enter valid email";
                            }
                          },
                        ),
                        SizedBox(height: 12),

                        Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "WorkSans"),
                        ),

                        /// Password address field
                        CustomTextField(
                          // onChanged: (value) {
                          //   model.appUser.password = value;
                          // },
                          //  obscureText: model.isVisiblePassword,
                          keyBoardType: TextInputType.visiblePassword,
                          // suffixIcon: IconButton(
                          //   onPressed: () {
                          //     //model.visiblePassword();
                          //   },
                          //   icon: model.isVisiblePassword
                          //       ? Icon(
                          //           Icons.visibility_off,
                          //           color: Colors.white,
                          //           size: 20,
                          //         )
                          //       : Icon(
                          //           Icons.visibility,
                          //           color: Colors.white,
                          //           size: 20,
                          //         ),
                          // ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password can't be empty";
                            }
                            if (value.length < 6) {
                              return "Password length must be 6 characters";
                            }
                          },
                        ),

                        Row(
                          children: [
                            Flexible(
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Colors
                                        .grey, // Set the unselected color here
                                  ),
                                  // child: Icon(Icons.add),
                                  child: Checkbox(
                                    focusColor: Colors.grey,
                                    focusNode: checkBoxNode,
                                    value: model.isAgreeTermsAndConditions,
                                    onChanged: (newValue) {
                                      model.termsAndConditions(newValue);
                                    },
                                    activeColor: Colors.grey,
                                    checkColor: Colors.white,
                                  ),
                                ),
                                title: Text(
                                  "Remember me? ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                                // Text('By signing up you must agree to our Terms and Conditions',),
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(fontSize: 14),
                                ))
                          ],
                        ),
                      ],
                    ),

                    ///
                    /// Login Button
                    ///
                    CustomButton(
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DashboardScreen(),
                            ));
                      },
                      width: 500,
                      height: 40,
                      borderColor: Color(0xFF554279),
                      Fontweight: FontWeight.bold,
                      backgroungColor: Colors.teal,
                      textColor: Colors.white,
                      text: 'Sign in',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }));
  }
}
