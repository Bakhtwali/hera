// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:englishtalkedesktop/Ui/side_bar.dart';
import 'package:englishtalkedesktop/core/custom_widgets/cstm_text_field.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class InstitutionProfile extends StatefulWidget {
  @override
  State<InstitutionProfile> createState() => _InstitutionProfileState();
}

class _InstitutionProfileState extends State<InstitutionProfile> {
  DateTime today = DateTime.now();
  int currentStep = 0; // Track the current step

  TextEditingController _imageAddressController = TextEditingController();

  //for Date Picker
  String? selectedValue;
  DateTime? selectedDate;
  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      }
    });
  }

  void handleDateSelected(DateTime? date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  void dispose() {
    _imageAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateTimeFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 253, 253),
      body: Row(
        children: [
          SideBar(),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100.h,
                  width: MediaQuery.of(context).size.width / 1.28,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Welcome To HERA ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '(MIS User)',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              DateFormat('EEE MMM d yyyy')
                                  .format(DateTime.now()),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20.0,
                              backgroundImage: AssetImage('assets/profile.png'),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              'Siddique Dawar',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),
                            CustomButton(
                              ontap: () {},
                              backgroungColor: Colors.teal,
                              text: 'Log Out',
                              textColor: Colors.white,
                              borderColor: Colors.teal,
                            ),
                            SizedBox(width: 30),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Container(
                        width: 900.w,
                        height: 900.h,
                        child: Column(
                          children: [
                            Flexible(
                              child: Stepper(
                                controlsBuilder: (context, controller) =>
                                    Row(children: []),
                                currentStep:
                                    currentStep, // Set the current step
                                onStepTapped: (step) {
                                  setState(() {
                                    currentStep = step; // Handle step tap
                                  });
                                },
                                steps: [
                                  Step(
                                    title: Text(
                                        'Basic Data - (Fill the basic data)'),
                                    content: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomTextField(
                                          // hintText: 'Enter Institute Name',
                                          labelText: 'Institute Name',
                                        ),
                                        SizedBox(height: 10),
                                        cstListBox(
                                          values: [
                                            'Peshawar',
                                            'Mardan',
                                            'Charsadda'
                                          ],
                                          hint: 'Select District',
                                        ),
                                        SizedBox(height: 10),
                                        CustomTextField(
                                          // hintText: 'Enter Institute Name',
                                          labelText: 'Complete Address',
                                        ),
                                        SizedBox(height: 10),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: cstListBox(
                                            values: [
                                              'University',
                                              'DAI',
                                              'College'
                                            ],
                                            hint:
                                                'Select University/DAI/College',
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: cstListBox(
                                            values: [
                                              'University',
                                              'Medical College ',
                                              'Engineering College',
                                              'Allied Health Sciences',
                                              'General College',
                                              'Homeopetheic College'
                                            ],
                                            hint: 'Institution Type',
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: cstListBox(
                                            values: [
                                              'MBBS',
                                              'Dental'
                                                  'MBBS & Dental',
                                              'Engineering College',
                                              'GBSN (4-Years) & Post RN',
                                              'DPT',
                                              'Homeopetheic Courses'
                                            ],
                                            hint: 'Discipline Type',
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        cstDatePicker(
                                          hintText:
                                              'First Registration with HERA',
                                          onDateSelected: handleDateSelected,
                                        ),
                                        SizedBox(height: 10),
                                        CustomTextField(
                                          // hintText: 'Enter Institute Name',
                                          labelText: 'Website',
                                        ),
                                        SizedBox(height: 10),
                                        CustomTextField(
                                          labelText: 'Official Contact#',
                                        ),
                                        SizedBox(height: 10),
                                        CustomTextField(
                                          labelText: 'WhatsApp#',
                                        ),
                                        SizedBox(height: 10),
                                        CustomTextField(
                                          labelText: 'Official email',
                                        ),
                                        SizedBox(height: 10),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: cstListBox(
                                            values: [
                                              'Active',
                                              'Default',
                                              'De-Registered',
                                            ],
                                            hint: 'Status of Registration',
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        CustomTextField(
                                          labelText: 'Owner Name',
                                        ),
                                        SizedBox(height: 10),
                                        CustomTextField(
                                          labelText: 'Contact#',
                                        ),
                                        SizedBox(height: 10),
                                        CustomTextField(
                                          labelText:
                                              'VC/Principal/Admin/Director Name',
                                        ),
                                        SizedBox(height: 10),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: cstListBox(
                                            values: [
                                              'Ph.D',
                                              'FCPS',
                                              'MBBS',
                                              'MS',
                                              'M.Phil',
                                              'Master',
                                            ],
                                            hint: 'Qualification',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Step(
                                    title: Text(
                                        'Certificate/Other Attachement (Uploads)'),
                                    content: Column(
                                      children: [
                                        Container(
                                          width: 150,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              _imageAddressController
                                                      .text.isEmpty
                                                  ? 'No Image Address'
                                                  : _imageAddressController
                                                      .text,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        ElevatedButton(
                                          onPressed: _getImage,
                                          child: Text("Select Image"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Step(
                                    title: Text('Institution Profile'),
                                    content: Column(
                                      children: [
                                        Text(
                                            'The Text Goes Here for Institution Profile'),
                                        // You can add more content to this step as needed
                                      ],
                                    ),
                                  ),
                                  Step(
                                    title: Text('Institution Profile'),
                                    content: Column(
                                      children: [
                                        Text(
                                            'The Text Goes Here for Institution Profile'),
                                        // You can add more content to this step as needed
                                      ],
                                    ),
                                  ),
                                  Step(
                                    title: Text('Institution Profile'),
                                    content: Column(
                                      children: [
                                        Text(
                                            'The Text Goes Here for Institution Profile'),
                                        // You can add more content to this step as needed
                                      ],
                                    ),
                                  ),
                                  Step(
                                    title: Text('Institution Profile'),
                                    content: Column(
                                      children: [
                                        Text(
                                            'The Text Goes Here for Institution Profile'),
                                        // You can add more content to this step as needed
                                      ],
                                    ),
                                  ),
                                  Step(
                                    title: Text('Institution Profile'),
                                    content: Column(
                                      children: [
                                        Text(
                                            'The Text Goes Here for Institution Profile'),
                                        // You can add more content to this step as needed
                                      ],
                                    ),
                                  ),
                                  Step(
                                    title: Text('Institution Profile'),
                                    content: Column(
                                      children: [
                                        Text(
                                            'The Text Goes Here for Institution Profile'),
                                        // You can add more content to this step as needed
                                      ],
                                    ),
                                  ),
                                  Step(
                                    title: Text('Institution Profile'),
                                    content: Column(
                                      children: [
                                        Text(
                                            'The Text Goes Here for Institution Profile'),
                                        // You can add more content to this step as needed
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: currentStep < 1
                                      ? null
                                      : () {
                                          setState(() {
                                            currentStep--;
                                          });
                                        },
                                  child: Text('Previous'),
                                ),
                                SizedBox(
                                    width: 12), // Add spacing between buttons
                                ElevatedButton(
                                  onPressed: currentStep < 1
                                      ? null
                                      : () {
                                          setState(() {
                                            currentStep++;
                                          });
                                        },
                                  child: Text('Next'),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
