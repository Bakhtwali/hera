import 'package:englishtalkedesktop/Ui/screens/side_bar.dart';
import 'package:englishtalkedesktop/core/custom_widgets/cstm_text_field.dart';
import 'package:flutter/material.dart';

class appSubmssion extends StatefulWidget {
  @override
  State<appSubmssion> createState() => _Screen1State();
}

class _Screen1State extends State<appSubmssion> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  const Text(
                    'Institution Submission to App for Inspection',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Please select appropriate Institution for Submission',
                  ),
                  const SizedBox(height: 40),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: cstListBox(
                      values: [
                        'Fresh Inspection Question',
                        'Review Inspection Question',
                        'Renewal Inspection Question'
                      ],
                      hint: 'Select Inspection Type',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: cstListBox(
                      values: [
                        'IQRA National University',
                        'Rehman Medical Institute',
                        'Nothwest School of Medicine'
                      ],
                      hint: 'Select University/College/Institute',
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: cstListBox(
                      values: [
                        'Medical College',
                        'Engineering College',
                        'Allied Health Sciences',
                        'Others'
                      ],
                      hint: 'Select College Type',
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: cstListBox(
                      values: [
                        'ali@gmail.com',
                        'Inspector1@gmail.com',
                        'kmu@gmail.com',
                        'Others'
                      ],
                      hint: 'Select Assessor/Inpsector Account',
                    ),
                  ),
                  SizedBox(height: 10),
                  cstDatePicker(
                    hintText: 'Select Date',
                    onDateSelected: (DateTime? selectedDate) {
                      setState(() {
                        _selectedDate = selectedDate;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (_selectedDate != null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Selected Date: ${_selectedDate!.toString()}',
                        style: TextStyle(fontSize: 16),
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
          ),
        ],
      ),
    );
  }
}
