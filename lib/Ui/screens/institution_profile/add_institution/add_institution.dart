import 'package:englishtalkedesktop/Ui/screens/institution_profile/add_institution/add_institution_provider.dart';
import 'package:englishtalkedesktop/core/custom_widgets/cstm_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddInstitutionProfile extends StatefulWidget {
  const AddInstitutionProfile({Key? key}) : super(key: key);
  @override
  State<AddInstitutionProfile> createState() => _AddInstitutionProfileState();
}

class _AddInstitutionProfileState extends State<AddInstitutionProfile> {
  DateTime today = DateTime.now();
  int currentStep = 0; // Track the current step
  @override
  Widget build(BuildContext context) {
    final DateFormat dateTimeFormat = DateFormat('yyyy-MM-dd');
    return ChangeNotifierProvider(
      create: (context) => AddInstitutionProfileProvider(),
      child: Consumer<AddInstitutionProfileProvider>(
        builder: (context, model, child) => Row(
          children: [
            SizedBox(
                width: 900.w,
                height: 900.h,
                child: Column(
                  children: [
                    Flexible(
                      child: Stepper(
                        controlsBuilder: (context, controller) =>
                            const Row(children: []),
                        currentStep: currentStep, // Set the current step
                        onStepTapped: (step) {
                          setState(() {
                            currentStep = step; // Handle step tap
                          });
                        },
                        steps: [
                          Step(
                            title: const Text(
                                'Basic Data - (Fill the basic data)'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel.instituteName =
                                        val;
                                  },
                                  labelText: 'Institute Name*',
                                ),
                                SizedBox(height: 10.h),
                                cstListBox(
                                  onchanged: (String? newValue) {
                                    model.instituteProfileModel.district =
                                        newValue!;
                                  },
                                  values: const [
                                    'Peshawar',
                                    'Mardan',
                                    'Charsadda',
                                  ],
                                  hint: 'Select District*',
                                ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel
                                        .completeAddress = val;
                                  },
                                  // hintText: 'Enter Institute Name',
                                  labelText: 'Complete Address*',
                                ),
                                SizedBox(height: 10.h),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: cstListBox(
                                    onchanged: (String? newValue) {
                                      model.instituteProfileModel
                                          .universityType = newValue!;
                                    },
                                    values: const [
                                      'University',
                                      'DAI',
                                      'College'
                                    ],
                                    hint: 'Select University/DAI/College*',
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: cstListBox(
                                    onchanged: (String? newValue) {
                                      model.instituteProfileModel
                                          .instituteType = newValue!;
                                    },
                                    values: const [
                                      'University',
                                      'Medical College ',
                                      'Engineering College',
                                      'Allied Health Sciences',
                                      'General College',
                                      'Homeopetheic College'
                                    ],
                                    hint: 'Institution Type*',
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: cstListBox(
                                    onchanged: (String? newValue) {
                                      model.instituteProfileModel.displineType =
                                          newValue!;
                                    },
                                    values: const [
                                      'MBBS',
                                      'Dental'
                                          'MBBS & Dental',
                                      'Engineering College',
                                      'GBSN (4-Years) & Post RN',
                                      'DPT',
                                      'Homeopetheic Courses'
                                    ],
                                    hint: 'Discipline Type*',
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                cstDatePicker(
                                  hintText: model.instituteProfileModel
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
                                        .firstRegistrationDateWithHera = date;
                                  },
                                ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel.websiteLink =
                                        val;
                                  },
                                  labelText: 'Website',
                                ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel.officialNumber =
                                        val;
                                  },
                                  labelText: 'Official Contact#',
                                ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel.whatsappNumber =
                                        val;
                                  },
                                  labelText: 'WhatsApp#*',
                                ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel.email = val;
                                  },
                                  labelText: 'Official email',
                                ),
                                SizedBox(height: 10.h),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: cstListBox(
                                    onchanged: (String? newValue) {
                                      model.instituteProfileModel
                                          .statusOfRegistration = newValue!;
                                    },
                                    values: const [
                                      'Active',
                                      'Default',
                                      'De-Registered',
                                    ],
                                    hint: 'Status of Registration*',
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0.h,
                                ),
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel.ownerName = val;
                                  },
                                  labelText: 'Owner Name',
                                ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel.ownerPhoneName =
                                        val;
                                  },
                                  labelText: 'Contact#',
                                ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel.directorName =
                                        val;
                                  },
                                  labelText: 'VC/Principal/Admin/Director Name',
                                ),
                                SizedBox(height: 10.h),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: cstListBox(
                                    onchanged: (val) {
                                      model.instituteProfileModel
                                          .directorQualification = val!;
                                    },
                                    values: const [
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
                            title: const Text(
                                'Certificate/Other Attachement (Uploads)'),
                            content: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText:
                                                'HERA Certificate Upload',
                                            hintText: 'Not Attached Yet',
                                          ),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        model.heraCertificate =
                                            await model.getImage();
                                      },
                                      child: const Text("Select Image"),
                                    ),
                                  ],
                                ),
                                // The  Public Sector University Affiliation Certificate (KMU, Peshawar University or any)
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText:
                                                'Public Sector University Certificate',
                                            hintText: 'Not Attached Yet',
                                          ),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        model.publicSectorUniversityCertificate =
                                            await model.getImage();
                                      },
                                      child: const Text("Select Image"),
                                    ),
                                  ],
                                ),
                                // PNC Or Other Affiliation Booard Certficate Attached
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText:
                                                'Council Affilation Certiificate (if any)',
                                            hintText: 'Not Attached Yet',
                                          ),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        model.counilAffiationCertificate =
                                            await model.getImage();
                                      },
                                      child: const Text("Select Image"),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText:
                                                'Institution Logo /Banner',
                                            hintText: 'Not Attached Yet',
                                          ),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        model.instituteLogo =
                                            await model.getImage();
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
                            title: const Text(
                                'Enrolled Students Data and Faculty Data'),
                            content: Column(
                              children: [
                                CustomTextField(
                                  labelText: 'Total Classes',
                                  onChanged: (val) {
                                    model.instituteProfileModel.totalClasses =
                                        val;
                                  },
                                ),
                                SizedBox(height: 10.h),
                                // CustomTextField(
                                //   labelText: 'Session',
                                // ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel
                                        .totalmaleStudents = val;
                                  },
                                  labelText: 'Total Male Students',
                                ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel
                                        .totalfemaleStudents = val;
                                  },
                                  labelText: 'Total Female Students',
                                ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel
                                        .totalNmdStudents = val;
                                  },
                                  labelText: 'Total NMDs Students',
                                ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel
                                        .totalScholarshipadvertised = val;
                                  },
                                  labelText: 'Total Scholarship Advertised',
                                ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel
                                        .totalScholarshipawarded = val;
                                  },
                                  labelText: 'Total Scholarship Awarded',
                                ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel.totalFaculty =
                                        val;
                                  },
                                  labelText: 'Total Faculty',
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),

                          Step(
                            title: const Text(
                                'Complaints Lodged on PCP or Others'),
                            content: Column(
                              children: [
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel
                                        .totalComplaintlodgedOnPCP = val;
                                  },
                                  labelText: 'Total Complaints Lodged on PCP',
                                ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel
                                            .totalComplaintEmailedOrOtherSource =
                                        val;
                                  },
                                  labelText:
                                      'Total Complaints Emailed or Other Soruces',
                                ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel
                                        .totalSolvedComplaints = val;
                                  },
                                  labelText: 'Total Solved Complaints',
                                ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  onChanged: (val) {
                                    model.instituteProfileModel
                                        .totalUnSolvedComplaints = val;
                                  },
                                  labelText: 'Total Undissolved Complaints',
                                ),
                                SizedBox(height: 10.h),
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
                        SizedBox(width: 12.w), // Add spacing between buttons
                        ElevatedButton(
                          onPressed: currentStep < 0
                              ? null
                              : () {
                                  if (currentStep == 3) {
                                    model.addDataToFirebase();
                                  } else {
                                    setState(() {
                                      currentStep++;
                                      print('current step is $currentStep');
                                    });
                                  }
                                },
                          child: Text(currentStep == 3 ? 'add record' : 'Next'),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
