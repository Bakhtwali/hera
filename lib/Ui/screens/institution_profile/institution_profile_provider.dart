import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishtalkedesktop/core/model/institute_profile_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InstitutionProfileProvider extends ChangeNotifier {
  FilePickerResult? heraCertificate;
  FilePickerResult? publicSectorUniversityCertificate;
  FilePickerResult? counilAffiationCertificate;
  FilePickerResult? instituteLogo;
  InstituteProfileModel instituteProfileModel = InstituteProfileModel();

  selectedDate(DateTime date) {
    instituteProfileModel.firstRegistrationDateWithHera = date;
    notifyListeners();
  }

  addDataToFirebase() async {
    bool ischeck = chackValidation();

    if (heraCertificate != null) {
      instituteProfileModel.heraCertificate =
          await addImageToFirebase(heraCertificate);
    }
    if (publicSectorUniversityCertificate != null) {
      instituteProfileModel.publicSectorUniversityCertificate =
          await addImageToFirebase(publicSectorUniversityCertificate);
    }
    if (counilAffiationCertificate != null) {
      instituteProfileModel.counilAffiationCertificate =
          await addImageToFirebase(counilAffiationCertificate);
    }
    if (instituteLogo != null) {
      instituteProfileModel.instituteLogo =
          await addImageToFirebase(instituteLogo);
    }

    if (ischeck) {
      try {
        print('this is is test ${instituteProfileModel.heraCertificate}');
        await FirebaseFirestore.instance
            .collection('InstituteProfile')
            .add(instituteProfileModel.toJson())
            .then((value) {
          instituteProfileModel.id = value.id;
          FirebaseFirestore.instance
              .collection('InstituteProfile')
              .doc(value.id)
              .update({'id': value.id});
        }).then((value) {
          print('data is added to the firebase');
          Get.snackbar('Success', 'Data added successfully',
              backgroundColor: Colors.teal,
              snackPosition: SnackPosition.BOTTOM,
              maxWidth: 400);
        });
      } catch (e) {
        Get.snackbar('Error', 'Something went wrong',
            backgroundColor: Colors.teal,
            snackPosition: SnackPosition.BOTTOM,
            maxWidth: 400);
      }
    } else {
      Get.snackbar('Error', 'Something went wrong',
          backgroundColor: Colors.teal,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
    }
  }

  bool videoSelected = false;
  String? urlImage;
  bool imageloader = false;

  getImage() async {
    FilePickerResult? result;
    print('this is getImage function');
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'png',
      ],
    );
    if (result != null) {
      return result;
    } else {
      return null;
    }
  }

  Future<String?> addImageToFirebase(image) async {
    imageloader = true;
    notifyListeners();
    log('111111111111 ');
    if (image != null) {
      Uint8List? file = image!.files.first.bytes;
      String fileName = image!.files.first.name;

      try {
        Reference ref = FirebaseStorage.instance
            .ref('school/$fileName')
            .child('datas ${DateTime.now().microsecondsSinceEpoch}');
        UploadTask uploadTask = ref.putData(file!);
        TaskSnapshot result = await uploadTask;

        String imageUrl = await result.ref.getDownloadURL();
        imageloader = false;
        notifyListeners();
        return imageUrl;

        // urlImage = await task.ref.getDownloadURL();
      } catch (e) {
        log('show error $e');
      }
    } else {
      imageloader = false;
      notifyListeners();
    }
    imageloader = false;
    notifyListeners();
    return null;
  }

  chackValidation() {
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
