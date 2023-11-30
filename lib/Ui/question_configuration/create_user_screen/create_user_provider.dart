import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishtalkedesktop/core/model/create_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUserProvider extends ChangeNotifier {
  CreateUserModel createUserModel = CreateUserModel();

  createUserFunction() async {
    createUserModel.createat = DateTime.now();

    // bool check = checkValidation();
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: createUserModel.email!,
              password: createUserModel.password!)
          .then((value) async {
        try {
          await FirebaseFirestore.instance
              .collection('appuser')
              .add(
                createUserModel.toJson(),
              )
              .then((value) {
            log('data added to appuser collection');
            FirebaseFirestore.instance
                .collection('appuser')
                .doc(value.id)
                .update({'id': value.id});
          });
        } catch (e) {
          Get.snackbar('Error', 'error in creation $e',
              backgroundColor: Colors.red,
              snackPosition: SnackPosition.BOTTOM,
              maxWidth: 400);
        }
        log('app user added to auth section');
      });
    } catch (e) {
      Get.snackbar('Error', 'error in creation $e',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
    }

    // Get.snackbar('Alert', 'this is snakebar',
    //     backgroundColor: Colors.teal,
    //     snackPosition: SnackPosition.BOTTOM,
    //     maxWidth: 400);
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
