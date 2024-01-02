import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishtalkedesktop/core/model/create_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUserProvider extends ChangeNotifier {
  CreateUserModel createUserModel = CreateUserModel();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool islaoding = false;

  createUserFunction() async {
    createUserModel.createat = DateTime.now();

    bool check = checkValidation();
    if (check) {
      islaoding = true;
      notifyListeners();
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: createUserModel.email!,
                password: createUserModel.password!)
            .then((value) async {
          try {
            createUserModel.isUserBlocked = false;

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
                  .update({'id': value.id}).then((value) {
                islaoding = false;
                nameController.clear();
                emailController.clear();
                passwordController.clear();
                confirmPasswordController.clear();
                notifyListeners();

                Get.snackbar('Account Created', 'Account Created Successfully!',
                    backgroundColor: Color.fromARGB(255, 245, 245, 245),
                    snackPosition: SnackPosition.TOP,
                    maxWidth: 400);
              });
            });
          } catch (e) {
            islaoding = false;
            notifyListeners();
            Get.snackbar('Error', 'error in creation $e',
                backgroundColor: Colors.red,
                snackPosition: SnackPosition.BOTTOM,
                maxWidth: 400);
          }
          log('app user added to auth section');
        });
      } catch (e) {
        islaoding = false;
        notifyListeners();
        Get.snackbar('Error', 'error in creation $e',
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
            maxWidth: 400);
      }
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
    } else if (createUserModel.email == null ||
        createUserModel.email!.isEmpty) {
      Get.snackbar('Alert', 'Plesae enter your email',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
      return false;
    } else if (createUserModel.password == null ||
        createUserModel.password!.isEmpty) {
      Get.snackbar('Alert', 'Plesae enter your password',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
      return false;
    } else if (createUserModel.confirmPassword == null ||
        createUserModel.confirmPassword!.isEmpty) {
      Get.snackbar('Alert', 'Plesae enter your confirm Password',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
      return false;
    } else if (createUserModel.confirmPassword != createUserModel.password) {
      Get.snackbar('Alert', 'Your password does not matched',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
      return false;
    } else {
      return true;
    }
  }
}
