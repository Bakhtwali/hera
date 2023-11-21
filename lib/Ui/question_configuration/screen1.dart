import 'package:englishtalkedesktop/Ui/side_bar.dart';
import 'package:englishtalkedesktop/core/custom_widgets/cstm_text_field.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: cstListBox(
                      values: [
                        'Fresh Inspection Question',
                        'Review Inspection Question',
                        'Renewal Inspection Question'
                      ],
                      hint: 'Select Question Type',
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: cstListBox(
                      values: [
                        'Management',
                        'Registration',
                        'Board of Governors',
                        'Disciplines(s)',
                        'Teaching Faculty',
                        'Library - Racks Center Table & Chair',
                        'Infrastructure / General Facilities',
                        'Gross Area',
                        'Website',
                        'Hostel: - Cubicle: Dormitories: Dining & Gross Space',
                        'Scholarships and Free Ships',
                        'Finance',
                      ],
                      hint: 'Select Question Group',
                    ),
                  ),
                  CustomTextField(
                    labelText: 'Question No',
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    labelText: 'Question Text',
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: cstListBox(
                      values: [
                        'Medical College',
                        'Engineering College',
                        'Degree Awarding Institute',
                        'University'
                            'Allied Health Sciences',
                        'Homepatheic College',
                        'Professional College',
                        'General College',
                        'Vocational College',
                      ],
                      hint: 'Select Question Group',
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      const Spacer(), // Add Spacer to create equal space on the left
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Save Record'),
                      ),
                      SizedBox(
                        width: 8.0,
                      ), // Add Spacer to create equal space between buttons
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Update Record'),
                      ),
                      SizedBox(
                        width: 8.0,
                      ), // Add Spacer to create equal space between buttons
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Show All'),
                      ),
                      Spacer(), // Add Spacer to create equal space on the right
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
