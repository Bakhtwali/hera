import 'package:englishtalkedesktop/core/model/institute_profile_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InstittuionProfile extends StatelessWidget {
  InstituteProfileModel model;
  InstittuionProfile({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Institution Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Institution Name: ${model.instituteName}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Image.network(
            //   imageUrl,
            //   height: 150, // Adjust the height as needed
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
            SizedBox(height: 10),
            Text(
              'Institution Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
