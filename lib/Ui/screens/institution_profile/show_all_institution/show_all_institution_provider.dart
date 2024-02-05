import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishtalkedesktop/core/model/institute_profile_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ShowAllInstitutionProvider extends ChangeNotifier {
  ShowAllInstitutionProvider() {
    getallInstitutions();
  }
  String loaderid = '';
  bool isloadprofile = false;
  int selectedindex = -1;
  InstituteProfileModel instituteProfileModel = InstituteProfileModel();
  List<InstituteProfileModel> instituteProfileModelList = [];
  getallInstitutions() {
    print('this is the get all institution');
    FirebaseFirestore.instance
        .collection('InstituteProfile')
        .snapshots()
        .listen((event) {
      instituteProfileModelList = [];
      for (var element in event.docs) {
        instituteProfileModelList
            .add(InstituteProfileModel.fromJson(element.data(), element.id));
      }
      notifyListeners();
    });

    notifyListeners();
  }

  deleteFunction(id) async {
    loaderid = id;
    notifyListeners();
    await FirebaseFirestore.instance
        .collection('InstituteProfile')
        .doc(id)
        .delete();
    loaderid = '';
    notifyListeners();
  }

  showprofile(status,index) {
    selectedindex = index;
    isloadprofile = status;
    notifyListeners();
  }
}
