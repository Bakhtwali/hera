import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishtalkedesktop/core/model/new_question_model.dart';
import 'package:flutter/material.dart';

class ShowAllquestionprovider extends ChangeNotifier {
  ShowAllquestionprovider() {
    print('this is is test print');
    log('this is is test print');
    getAllQuestion();
  }
  int activequestion = 1;
  bool loader = false;
  List<NewQuestionModel> newQuestionList = [];
  List<NewQuestionModel> reviewQuestionList = [];
  List<NewQuestionModel> renewlQuestionList = [];
  getAllQuestion() {
    print('get all question');

    FirebaseFirestore.instance
        .collection('Questions')
        .snapshots()
        .listen((event) {
      newQuestionList = [];
      reviewQuestionList = [];
      renewlQuestionList = [];
      print('this is event $event');
      event.docs.forEach((element) {
        print(element.data());
        NewQuestionModel newQuestionModel =
            NewQuestionModel.fromJson(element.data(), element.id);
        if (newQuestionModel.typeOfQuestion == "Fresh Inspection Question") {
          newQuestionList.add(newQuestionModel);
        } else if (newQuestionModel.typeOfQuestion ==
            "Review Inspection Question") {
          reviewQuestionList.add(newQuestionModel);
        } else if (newQuestionModel.typeOfQuestion ==
            "Renewal Inspection Question") {
          renewlQuestionList.add(newQuestionModel);
        }

        print('newQuestionList ${newQuestionList.length}');
        notifyListeners();
      });
    });
  }

  changeActive(val) {
    activequestion = val;
    notifyListeners();
  }

  DeleteQuestion(String id) {
    loader = true;
    notifyListeners();
    FirebaseFirestore.instance.collection('Questions').doc(id).delete();
    loader = false;
    notifyListeners();
    print('this is delete question function $id');
    // FirebaseFirestore.instance.collection('Questions').doc(id).delete();
  }
}
