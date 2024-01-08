// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:englishtalkedesktop/Ui/screens/institution_profile/institution_profile_provider.dart';
import 'package:englishtalkedesktop/Ui/screens/side_bar.dart';
import 'package:englishtalkedesktop/core/custom_widgets/cstm_text_field.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
        print('this is image path ${_image!.path}');
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
    final DateFormat dateTimeFormat = DateFormat('yyyy-MM-dd');

    return ChangeNotifierProvider(
      create: (context) => InstitutionProfileProvider(),
      child: Consumer<InstitutionProfileProvider>(
        builder: (context, model, child) => Scaffold(
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
                                  backgroundImage:
                                      AssetImage('assets/profile.png'),
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
                        SizedBox(
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
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                    .instituteName = val;
                                              },
                                              labelText: 'Institute Name',
                                            ),
                                            SizedBox(height: 10),
                                            cstListBox(
                                              onchanged: (String? newValue) {
                                                model.instituteProfileModel
                                                    .district = newValue!;
                                              },
                                              values: const [
                                                'Peshawar',
                                                'Mardan',
                                                'Charsadda',
                                              ],
                                              hint: 'Select District',
                                            ),
                                            SizedBox(height: 10),
                                            CustomTextField(
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                    .completeAddress = val;
                                              },
                                              // hintText: 'Enter Institute Name',
                                              labelText: 'Complete Address',
                                            ),
                                            SizedBox(height: 10),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: cstListBox(
                                                onchanged: (String? newValue) {
                                                  model.instituteProfileModel
                                                          .universityType =
                                                      newValue!;
                                                },
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
                                                onchanged: (String? newValue) {
                                                  model.instituteProfileModel
                                                          .instituteType =
                                                      newValue!;
                                                },
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
                                                onchanged: (String? newValue) {
                                                  model.instituteProfileModel
                                                      .displineType = newValue!;
                                                },
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
                                              hintText: model
                                                          .instituteProfileModel
                                                          .firstRegistrationDateWithHera ==
                                                      null
                                                  ? 'First Registration with HERA'
                                                  : dateTimeFormat.format(model
                                                      .instituteProfileModel
                                                      .firstRegistrationDateWithHera!),
                                              // 'First Registration with HERA',
                                              onDateSelected: (date) {
                                                model.selectedDate(date!);
                                                model.instituteProfileModel
                                                        .firstRegistrationDateWithHera =
                                                    date;
                                              },
                                            ),
                                            SizedBox(height: 10),
                                            CustomTextField(
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                    .websiteLink = val;
                                              },
                                              labelText: 'Website',
                                            ),
                                            SizedBox(height: 10),
                                            CustomTextField(
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                    .officialNumber = val;
                                              },
                                              labelText: 'Official Contact#',
                                            ),
                                            SizedBox(height: 10),
                                            CustomTextField(
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                    .whatsappNumber = val;
                                              },
                                              labelText: 'WhatsApp#',
                                            ),
                                            SizedBox(height: 10),
                                            CustomTextField(
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                    .email = val;
                                              },
                                              labelText: 'Official email',
                                            ),
                                            SizedBox(height: 10),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: cstListBox(
                                                onchanged: (String? newValue) {
                                                  model.instituteProfileModel
                                                          .statusOfRegistration =
                                                      newValue!;
                                                },
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
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                    .ownerName = val;
                                              },
                                              labelText: 'Owner Name',
                                            ),
                                            SizedBox(height: 10),
                                            CustomTextField(
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                    .ownerPhoneName = val;
                                              },
                                              labelText: 'Contact#',
                                            ),
                                            SizedBox(height: 10),
                                            CustomTextField(
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                    .directorName = val;
                                              },
                                              labelText:
                                                  'VC/Principal/Admin/Director Name',
                                            ),
                                            SizedBox(height: 10),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: cstListBox(
                                                onchanged: (val) {
                                                  model.instituteProfileModel
                                                          .directorQualification =
                                                      val!;
                                                },
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

                                      ////------> need to be done
                                      Step(
                                        title: Text(
                                            'Certificate/Other Attachement (Uploads)'),
                                        content: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'HERA Certificate Upload',
                                                        hintText:
                                                            'Not Attached Yet',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    model.heraCertificate =
                                                      await  model.getImage();
                                                  },
                                                  child: Text("Select Image"),
                                                ),
                                              ],
                                            ),
                                            // The  Public Sector University Affiliation Certificate (KMU, Peshawar University or any)
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Public Sector University Certificate',
                                                        hintText:
                                                            'Not Attached Yet',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () async {
                                                   
                                                         model.publicSectorUniversityCertificate =
                                                      await  model.getImage();
                                                  },
                                                  child: Text("Select Image"),
                                                ),
                                              ],
                                            ),
                                            // PNC Or Other Affiliation Booard Certficate Attached
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Council Affilation Certiificate (if any)',
                                                        hintText:
                                                            'Not Attached Yet',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () async {
                                                  
                                                           model.counilAffiationCertificate =
                                                      await  model.getImage();
                                                        
                                                  },
                                                  child: Text("Select Image"),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Institution Logo /Banner',
                                                        hintText:
                                                            'Not Attached Yet',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    
                                                           model.instituteLogo =
                                                      await  model.getImage();
                                                  },
                                                  child: Text("Select Image"),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),

                                      ///-----> need to be done
                                      Step(
                                        title: Text(
                                            'Enrolled Students Data and Faculty Data'),
                                        content: Column(
                                          children: [
                                            CustomTextField(
                                              labelText: 'Total Classes',
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                    .totalClasses = val;
                                              },
                                            ),
                                            SizedBox(height: 10),
                                            // CustomTextField(
                                            //   labelText: 'Session',
                                            // ),
                                            SizedBox(height: 10),
                                            CustomTextField(
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                    .totalmaleStudents = val;
                                              },
                                              labelText: 'Total Male Students',
                                            ),
                                            SizedBox(height: 10),
                                            CustomTextField(
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                    .totalfemaleStudents = val;
                                              },
                                              labelText:
                                                  'Total Female Students',
                                            ),
                                            SizedBox(height: 10),
                                            CustomTextField(
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                    .totalNmdStudents = val;
                                              },
                                              labelText: 'Total NMDs Students',
                                            ),
                                            SizedBox(height: 10),
                                            CustomTextField(
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                        .totalScholarshipadvertised =
                                                    val;
                                              },
                                              labelText:
                                                  'Total Scholarship Advertised',
                                            ),
                                            SizedBox(height: 10),
                                            CustomTextField(
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                        .totalScholarshipawarded =
                                                    val;
                                              },
                                              labelText:
                                                  'Total Scholarship Awarded',
                                            ),
                                            SizedBox(height: 10),
                                            CustomTextField(
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                    .totalFaculty = val;
                                              },
                                              labelText: 'Total Faculty',
                                            ),
                                            SizedBox(height: 20),
                                            // Row(
                                            //   children: [
                                            //     Spacer(), // Add Spacer to create equal space on the left
                                            //     ElevatedButton(
                                            //       onPressed: () {},
                                            //       child: Text('Save Record'),
                                            //     ),
                                            //     Spacer(), // Add Spacer to create equal space between buttons
                                            //     ElevatedButton(
                                            //       onPressed: () {},
                                            //       child: Text('Update Record'),
                                            //     ),
                                            //     Spacer(), // Add Spacer to create equal space between buttons
                                            //     ElevatedButton(
                                            //       onPressed: () {},
                                            //       child: Text('Show All'),
                                            //     ),
                                            //     Spacer(), // Add Spacer to create equal space on the right
                                            //   ],
                                            // )
                                          ],
                                        ),
                                      ),
                                      // Step(
                                      //   title: Text('Faculty Data'),
                                      //   content: Column(
                                      //     children: [
                                      //       CustomTextField(
                                      //         labelText: 'Employee Name',
                                      //       ),
                                      //       SizedBox(height: 10),
                                      //       Align(
                                      //         alignment: Alignment.centerLeft,
                                      //         child: cstListBox(
                                      //           values: [
                                      //             'Ph.D',
                                      //             'FCPS',
                                      //             'MBBS',
                                      //             'MS',
                                      //             'M.Phil',
                                      //             'Master',
                                      //             'BS',
                                      //             'B.Sc',
                                      //             'Metric (SSC)',
                                      //             '8th Class Pass',
                                      //             'Literate',
                                      //             'Other'
                                      //           ],
                                      //           hint: 'Qualification',
                                      //         ),
                                      //       ),
                                      //       SizedBox(height: 10),
                                      //       CustomTextField(
                                      //         labelText: 'Email Address',
                                      //       ),
                                      //       SizedBox(height: 10),
                                      //       CustomTextField(
                                      //         labelText: 'CNIC',
                                      //       ),
                                      //       SizedBox(height: 10),
                                      //       CustomTextField(
                                      //         labelText: 'Phone Contact',
                                      //       ),
                                      //       SizedBox(height: 10),
                                      //       CustomTextField(
                                      //         labelText: '',
                                      //       ),
                                      //       SizedBox(height: 10),
                                      //       CustomTextField(
                                      //         labelText: 'Highest Qualification',
                                      //       ),
                                      //       SizedBox(height: 10),
                                      //       CustomTextField(
                                      //         labelText: 'Date of Joining',
                                      //       ),
                                      //       SizedBox(height: 10),
                                      //       Align(
                                      //         alignment: Alignment.centerLeft,
                                      //         child: cstListBox(
                                      //           values: [
                                      //             'Chancellor',
                                      //             'Vice Chancellor',
                                      //             'Rector',
                                      //             'Director',
                                      //             'Dean of Faculty',
                                      //             'Head of Department (HoD)',
                                      //             'Principal',
                                      //             'Controller of Exaination',
                                      //             'Administrator',
                                      //             'Professor',
                                      //             'Assistant Professor (AP)',
                                      //             'Assistant',
                                      //             'Teacher',
                                      //             'Computer Operator',
                                      //             'Clerk',
                                      //             'Office Boy',
                                      //             'Driver',
                                      //             'Security Guard',
                                      //             'Plumber',
                                      //             'Electrician',
                                      //             'IT Officer',
                                      //           ],
                                      //           hint: 'Current Designation',
                                      //         ),
                                      //       ),
                                      //       SizedBox(height: 20),
                                      //       Row(
                                      //         children: [
                                      //           Spacer(), // Add Spacer to create equal space on the left
                                      //           ElevatedButton(
                                      //             onPressed: () {},
                                      //             child: Text('Save Record'),
                                      //           ),
                                      //           Spacer(), // Add Spacer to create equal space between buttons
                                      //           ElevatedButton(
                                      //             onPressed: () {},
                                      //             child: Text('Update Record'),
                                      //           ),
                                      //           Spacer(), // Add Spacer to create equal space between buttons
                                      //           ElevatedButton(
                                      //             onPressed: () {},
                                      //             child: Text('Show All'),
                                      //           ),
                                      //           Spacer(), // Add Spacer to create equal space on the right
                                      //         ],
                                      //       )
                                      //     ],
                                      //   ),
                                      // ),

                                      Step(
                                        title: Text(
                                            'Complaints Lodged on PCP or Others'),
                                        content: Column(
                                          children: [
                                            CustomTextField(
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                        .totalComplaintlodgedOnPCP =
                                                    val;
                                              },
                                              labelText:
                                                  'Total Complaints Lodged on PCP',
                                            ),
                                            SizedBox(height: 10),
                                            CustomTextField(
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                        .totalComplaintEmailedOrOtherSource =
                                                    val;
                                              },
                                              labelText:
                                                  'Total Complaints Emailed or Other Soruces',
                                            ),
                                            SizedBox(height: 10),
                                            CustomTextField(
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                        .totalSolvedComplaints =
                                                    val;
                                              },
                                              labelText:
                                                  'Total Solved Complaints',
                                            ),
                                            SizedBox(height: 10),
                                            CustomTextField(
                                              onChanged: (val) {
                                                model.instituteProfileModel
                                                        .totalUnSolvedComplaints =
                                                    val;
                                              },
                                              labelText:
                                                  'Total Undissolved Complaints',
                                            ),
                                            SizedBox(height: 10),
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
                                        width:
                                            12), // Add spacing between buttons
                                    ElevatedButton(
                                      onPressed: currentStep < 0
                                          ? null
                                          : () {
                                              if (currentStep == 3) {
                                                model.addDataToFirebase();
                                              } else {
                                                setState(() {
                                                  currentStep++;
                                                  print(
                                                      'current step is $currentStep');
                                                });
                                              }
                                            },
                                      child: Text(currentStep == 3
                                          ? 'add record'
                                          : 'Next'),
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
        ),
      ),
    );
  }
}
// The Class Data Grid starts Here
