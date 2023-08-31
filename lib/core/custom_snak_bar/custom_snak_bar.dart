
  import 'package:flutter/material.dart';

 customSnaks(context, String message){

  ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(message)),
      );
 }