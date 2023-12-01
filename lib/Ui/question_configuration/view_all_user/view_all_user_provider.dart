import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishtalkedesktop/core/model/create_user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    print('this is contructor for all user');
    GetAllUser();
  }

  CreateUserModel createUserModel = CreateUserModel();
  List<CreateUserModel> allUser = [];
  GetAllUser() async {
     FirebaseFirestore.instance
        .collection('appuser')
        .snapshots()
        .listen((event) {
      for (var element in event.docs) {
        allUser.add(CreateUserModel.fromJson(element.data(), element.id));
        notifyListeners();
      }
    });
  }
}
