import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishtalkedesktop/core/model/new_question_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewQuestionProvider extends ChangeNotifier {
  NewQuestionModel newQuestionModel = NewQuestionModel();
  bool isloader = false;

  addNewQuestionFunction() async {
    newQuestionModel.createat = DateTime.now();
    bool check = checkvalidation();
    print('validation completed ');
    if (check) {
      isloader = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection('Questions')
          .add(newQuestionModel.toJson())
          .then((value) async {
        await FirebaseFirestore.instance
            .collection('Questions')
            .doc(value.id)
            .update({'id': value.id});
      });
      isloader = false;
      notifyListeners();
      Get.snackbar('Alert', 'New Question is added to the database',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
    }
  }

  checkvalidation() {
    if (newQuestionModel.typeOfQuestion == null ||
        newQuestionModel.typeOfQuestion!.isEmpty) {
      Get.snackbar('Alert', 'Please select question type',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
      return false;
    } else if (newQuestionModel.mainGroup == null ||
        newQuestionModel.mainGroup!.isEmpty) {
      Get.snackbar('Alert', 'Please select main group of question',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
      return false;
    } else if (newQuestionModel.question == null ||
        newQuestionModel.question!.isEmpty) {
      Get.snackbar('Alert', 'Please enter question',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
      return false;
    } else if (newQuestionModel.questionGroup == null ||
        newQuestionModel.questionGroup!.isEmpty) {
      Get.snackbar('Alert', 'Please enter question',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
      return false;
    } else {
      return true;
    }
  }
}
