import 'package:englishtalkedesktop/Ui/screens/question_configuration/new_question_screen/new_question_provider.dart';
import 'package:englishtalkedesktop/core/custom_widgets/cstm_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class NewQuestionScreen extends StatefulWidget {
  const NewQuestionScreen({Key? key}) : super(key: key);

  @override
  State<NewQuestionScreen> createState() => _NewQuestionScreenState();
}

class _NewQuestionScreenState extends State<NewQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewQuestionProvider(),
      child: Consumer<NewQuestionProvider>(
        builder: (context, model, child) => Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          Text(
                            'Question Submmission Form ',
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Please configure the questions according to the requierment',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: cstListBox(
                        onchanged: (String? newValue) {
                          model.newQuestionModel.typeOfQuestion = newValue;
                        },
                        values: const [
                          'Fresh Inspection Question',
                          'Review Inspection Question',
                          'Renewal Inspection Question'
                        ],
                        hint: 'Select Question Type',
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: cstListBox(
                        onchanged: (String? newValue) {
                          model.newQuestionModel.mainGroup = newValue;
                        },
                        values: const [
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
                        hint: 'Select Main Group',
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    // CustomTextField(
                    //   labelText: 'Question No',
                    // ),
                    // SizedBox(height: 10.h),
                    CustomTextField(
                      labelText: 'Question Text',
                      onChanged: (value) {
                        model.newQuestionModel.question = value;
                      },
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: cstListBox(
                        onchanged: (String? newValue) {
                          model.newQuestionModel.questionGroup = newValue;
                        },
                        values: const [
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
                    SizedBox(height: 20.h),
                    model.isloader
                        ? Center(child: CircularProgressIndicator())
                        : Row(
                            children: [
                              const Spacer(), // Add Spacer to create equal space on the left
                              ElevatedButton(
                                onPressed: () {
                                  model.addNewQuestionFunction();
                                },
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
      ),
    );
  }
}
