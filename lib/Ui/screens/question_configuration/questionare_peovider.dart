import 'package:flutter/material.dart';

class QuestionareProvider extends ChangeNotifier {
  bool isActive = true;
  String searchTest = '';
  void changeActive(val) {
    print('chnage active function called ');
    if (val == 1) {
      isActive = true;
    } else {
      print('this is active false');
      isActive = false;
    }

    notifyListeners();
  }
}
