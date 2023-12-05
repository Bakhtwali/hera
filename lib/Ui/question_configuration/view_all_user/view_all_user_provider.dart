import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishtalkedesktop/core/model/create_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    print('this is contructor for all user');
    getAllUser();
  }
  bool isloadershow = false;
  String loaderid = '';
  CreateUserModel createUserModel = CreateUserModel();
  List<CreateUserModel> allUser = [];
  getAllUser() async {
    print('all user function call');
    allUser = [];
    FirebaseFirestore.instance
        .collection('appuser')
        .snapshots()
        .listen((event) {
      allUser = [];
      print('this is event $event');
      for (var element in event.docs) {
        allUser.add(CreateUserModel.fromJson(element.data(), element.id));
        notifyListeners();
      }
    });
  }

//this is delet user function

  deleteUser(String id, email, password) async {
    isloadershow = true;
    notifyListeners();
    //i get the id because i want to delet the user by id from firestore

    //write code to login a user with email and password
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print('user login');
    //when user become login then i can delet the user from auth section
    await FirebaseAuth.instance.currentUser!.delete();
    print('user delet from auth');

    //this is the code to delet the user from firestore by id
    await FirebaseFirestore.instance.collection('appuser').doc(id).delete();
    print('user delet from firestore');
    loaderid='';
    isloadershow = false;
    // await FirebaseFirestore.instance.collection('appuser').doc(id).delete();
    notifyListeners();
  }

  loaderfunction(id) {
    loaderid = id;
    notifyListeners();
  }
}
