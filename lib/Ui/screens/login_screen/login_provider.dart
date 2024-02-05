import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishtalkedesktop/core/Constants/constants.dart';
import 'package:englishtalkedesktop/core/Constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class loginProvider extends ChangeNotifier {
  String email = '';
  String password = '';
  bool isloading = false;

  Future<void> checkAdminCredentials(context) async {
    print('someone tap on me');
    if (email == '' || password == '') {
      Get.snackbar(
        'Alter',
        "please enter credential",
        colorText: WhiteColor,
        backgroundColor: kAmberColor,
      );
      print('please enter credential');
    } else {
      print('please enter credential');
      isloading = true;
      notifyListeners();
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference adminCollection = firestore.collection('admin');

      DocumentSnapshot adminSnapshot =
          await adminCollection.doc("oxMvmSBl49iwyibJF4Bo").get();

      Map<String, dynamic>? adminData =
          adminSnapshot.data() as Map<String, dynamic>?;
      print('please enter credential $adminData');
      print('please enter credential $email AND $password');
      if (adminData != null) {
        String adminEmail = adminData['email'];
        String adminPassword = adminData['password'];

        if (adminEmail == email && adminPassword == password) {
          Navigator.pushNamed(context, '/Home1');
          isloading = false;
          notifyListeners();
        } else {
          Get.snackbar('Alter', "Invalid credentail",
              colorText: WhiteColor,
              backgroundColor: kAmberColor,
              snackPosition: SnackPosition.BOTTOM);
          isloading = false;
          notifyListeners();
        }
      } else {}
    }
  }
}
