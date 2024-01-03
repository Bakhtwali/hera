import 'dart:io';

import 'package:englishtalkedesktop/core/model/institute_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InstitutionProfileProvider extends ChangeNotifier {
  File? heraCertificate;
  File? publicSectorUniversityCertificate;
  File? counilAffiationCertificate;
  File? instituteLogo;
  InstituteProfileModel instituteProfileModel = InstituteProfileModel();

  selectedDate(DateTime date) {
    instituteProfileModel.firstRegistrationDateWithHera = date;
    notifyListeners();
  }

  addDataToFirebase() {
    bool ischeck = ChackValidation();
    print('addDataToFirebase');
    print('this is heraCertificate ${heraCertificate?.path}');
    print(
        'this is publicSectorUniversityCertificate ${publicSectorUniversityCertificate?.path}');
    print(
        'this is counilAffiationCertificate ${counilAffiationCertificate?.path}');
    print('this is instituteLogo ${instituteLogo?.path}');
    if (ischeck) {
      print(instituteProfileModel.toJson());
    }
  }

  ChackValidation() {
    if (instituteProfileModel.instituteName == null ||
        instituteProfileModel.instituteName!.isEmpty) {
      Get.snackbar('Alert', 'Please enter institute name',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
      return false;
    } else if (instituteProfileModel.district == null ||
        instituteProfileModel.district!.isEmpty) {
      Get.snackbar('Alert', 'Please enter district name',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
      return false;
    } else if (instituteProfileModel.completeAddress == null ||
        instituteProfileModel.completeAddress!.isEmpty) {
      Get.snackbar('Alert', 'Please enter complete address',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
      return false;
    } else if (instituteProfileModel.universityType == null ||
        instituteProfileModel.universityType!.isEmpty) {
      Get.snackbar('Alert', 'Please enter Select University/DAI/college',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
      return false;
    } else if (instituteProfileModel.instituteType == null ||
        instituteProfileModel.instituteType!.isEmpty) {
      Get.snackbar('Alert', 'Please enter Select institute type',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
      return false;
    } else if (instituteProfileModel.displineType == null ||
        instituteProfileModel.displineType!.isEmpty) {
      Get.snackbar('Alert', 'Please enter Select displine type',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
      return false;
    } else if (instituteProfileModel.whatsappNumber == null ||
        instituteProfileModel.whatsappNumber!.isEmpty) {
      Get.snackbar('Alert', 'Please enter enter whatsappNumber',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
      return false;
    } else if (instituteProfileModel.statusOfRegistration == null ||
        instituteProfileModel.statusOfRegistration!.isEmpty) {
      Get.snackbar('Alert', 'Please enter select status of registration',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
      return false;
    } else {
      return true;
    }
  }
}
