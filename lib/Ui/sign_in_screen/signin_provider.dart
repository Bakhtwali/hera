// ignore_for_file: unused_local_variable

import 'package:englishtalkedesktop/core/model/user_model.dart';
import 'package:englishtalkedesktop/models/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/enums/view_state.dart';

class SignInProvider extends BaseViewModal {
  // final authInstant = FirebaseAuth.instance;
  bool isLoading = false;
  AppUser appUser = AppUser();
  final formKey = GlobalKey<FormState>();
  // CustomAuthResult customAuthResult = CustomAuthResult();
  // final _authService = locator<AuthServices>();
  // final databaseServices= DatabaseServices();
  bool isAgreeTermsAndConditions = false;

  ///
  /// Term and Condition ==========================================>>>
  ///

  termsAndConditions(value) {
    isAgreeTermsAndConditions = value;
    if (value == true) {}
    print("Terms and conditions $isAgreeTermsAndConditions");
    notifyListeners();
  }

  bool isVisiblePassword = true;

  ///
  /// Visible Password =================================>>>
  ///
  visiblePassword() {
    print("Password state : $isVisiblePassword");
    isVisiblePassword = !isVisiblePassword;
    notifyListeners();
    print("Password final state : $isVisiblePassword");
  }

  ///
  /// Login user ============================================>>>
  ///
  ///
  ///

  // loginToApp(AppUser appUser, BuildContext context) async {
  //   if (formKey.currentState!.validate()) {

  //       print("App user email: ${appUser.userEmail}");
  //       print("App user Password: ${appUser.password}");
  //       setState(ViewState.busy);

  //     customAuthResult = await _authService.adminLogin(appUser);
  //     print("is first login>>>>>> ${_authService.appUser.isFirstLogin}");

  //     if(customAuthResult.user != null){

  //       var res =await databaseServices.updatefirstLogin(true);

  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) =>
  //               AdminDashboard(),
  //         ),
  //       );
  //     }
  //     else {
  //       // showSnackBar(
  //       //   context,
  //       //   "${customAuthResult.errorMessage!}",
  //       //   duration: 5000,
  //       // );
  //     }

  //     setState(ViewState.idle);
  //   }
  // }
}
