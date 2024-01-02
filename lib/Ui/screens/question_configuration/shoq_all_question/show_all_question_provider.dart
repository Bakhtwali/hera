import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishtalkedesktop/core/model/new_question_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ShowAllquestionprovider extends ChangeNotifier {
  ShowAllquestionprovider() {
    print('this is is test print');
    log('this is is test print');
    getAllQuestion();
  }
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
        newQuestionList.add(newQuestionModel);
        print('newQuestionList ${newQuestionList.length}');
        notifyListeners();
      });
    });

    // .get().then((value) {
    //   value.docs.forEach((element) {
    //     print(element.data());
    //     NewQuestionModel newQuestionModel =
    //         NewQuestionModel.fromJson(element.data(), element.id);
    //     newQuestionList.add(newQuestionModel);
    //     print('newQuestionList ${newQuestionList.length}');
    //     notifyListeners();
    //   });
    // });
  }
}
