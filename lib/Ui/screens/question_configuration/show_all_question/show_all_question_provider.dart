import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishtalkedesktop/core/model/new_question_model.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:intl/intl.dart';
import 'package:csv/csv.dart';
import 'dart:convert';

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

  filterQuestion(val) {
    newQuestionList = [];
    reviewQuestionList = [];
    renewlQuestionList = [];
    //mainGroup
    FirebaseFirestore.instance
        .collection('Questions')
        .where('mainGroup', isEqualTo: val)
        .snapshots()
        .listen((event) {
      newQuestionList = [];
      reviewQuestionList = [];
      renewlQuestionList = [];
      notifyListeners();
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

  void generateCSV() {
    List<NewQuestionModel> AcceptedUser = [];
    if (activequestion == 1) {
      AcceptedUser = newQuestionList;
    } else if (activequestion == 2) {
      AcceptedUser = reviewQuestionList;
    } else {
      AcceptedUser = renewlQuestionList;
    }

    // we will declare the list of headers that we want
    List<String> rowHeader = [
      "Sr No.",
      "type Of Question",
      "main Group",
      "Question",
      "Question Group",
    ];
    // here we will make a 2D array to handle a row
    List<List<dynamic>> rows = [];
    //First add entire row header into our first row
    rows.add(rowHeader);
    //Now lets add 5 data rows

    if (AcceptedUser.isNotEmpty) {
      for (int i = 0; i < AcceptedUser.length; i++) {
        //everytime loop executes we need to add new row
        List<dynamic> dataRow = [];
        dataRow.add("${i + 1} ");
        dataRow.add("${AcceptedUser[i].typeOfQuestion} ");
        dataRow.add("${AcceptedUser[i].mainGroup}");
        dataRow.add("${AcceptedUser[i].question}");
        dataRow.add("${AcceptedUser[i].questionGroup} ");
        //lastly add dataRow to our 2d list
        rows.add(dataRow);
      }
//now convert our 2d array into the csvlist using the plugin of csv
      String csv = const ListToCsvConverter().convert(rows);
      //this csv variable holds entire csv data
      //Now Convert or encode this csv string into utf8
      final bytes = utf8.encode(csv);
      //NOTE THAT HERE WE USED HTML PACKAGE
      final blob = html.Blob([bytes]);
      //It will create downloadable object
      final url = html.Url.createObjectUrlFromBlob(blob);
      //It will create anchor to download the file
      final anchor = html.document.createElement('a') as html.AnchorElement
        ..href = url
        ..style.display = 'none'
        ..download = 'Questions.csv';
      //finally add the csv anchor to body
      html.document.body!.children.add(anchor);
      // Cause download by calling this function
      anchor.click();
      //revoke the object
      html.Url.revokeObjectUrl(url);
      //exportedOrders = [];
      AcceptedUser = [];
    }
  }
}
