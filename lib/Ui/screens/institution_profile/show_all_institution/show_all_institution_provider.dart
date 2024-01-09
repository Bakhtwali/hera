import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishtalkedesktop/core/model/institute_profile_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ShowAllInstitutionProvider extends ChangeNotifier {
  ShowAllInstitutionProvider() {
    getallInstitutions();
  }
  InstituteProfileModel instituteProfileModel = InstituteProfileModel();
  List<InstituteProfileModel> instituteProfileModelList = [];
  getallInstitutions() {
    instituteProfileModelList = [];
    print('this is the get all institution');
    FirebaseFirestore.instance
        .collection('InstituteProfile')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        instituteProfileModelList
            .add(InstituteProfileModel.fromJson(element.data(), element.id));
      });
      notifyListeners();
    });
    //     .then((value) {
    //   value.docs.forEach((element) {
    //     instituteProfileModelList
    //         .add(InstituteProfileModel.fromJson(element.data(), element.id));
    //   });
    // });
    notifyListeners();
  }
}
