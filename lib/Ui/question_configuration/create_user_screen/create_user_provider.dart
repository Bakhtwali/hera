import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishtalkedesktop/core/model/create_user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUserProvider extends ChangeNotifier {
  CreateUserModel createUserModel = CreateUserModel();

  createUserFunction() async {
    // bool check=  checkValidation();
    try {
      await FirebaseFirestore.instance.collection('appuser').add(
            createUserModel.toJson(),
          );
    } catch (e) {
      print('this is error $e');
    }
    // Get.snackbar('Alert', 'this is snakebar',
    //     backgroundColor: Colors.teal,
    //     snackPosition: SnackPosition.BOTTOM,
    //     maxWidth: 400);
    print('this is user name ${createUserModel.name}');
    print('this is user email ${createUserModel.email}');
    print('this is user password ${createUserModel.password}');
    print('this is user confirm ${createUserModel.confirmPassword}');
  }

  checkValidation() {
    if (createUserModel.name == null || createUserModel.name!.isEmpty) {
      Get.snackbar('Alert', 'Please enter your name',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
      return false;
    }
    // else if(){}
  }
}
