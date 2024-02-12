import 'package:englishtalkedesktop/Ui/screens/question_configuration/show_all_question/show_all_question_provider.dart';
import 'package:englishtalkedesktop/core/custom_widgets/cstm_text_field.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ShowAllQuestion extends StatefulWidget {
  @override
  State<ShowAllQuestion> createState() => _Screen1State();
}

class _Screen1State extends State<ShowAllQuestion> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShowAllquestionprovider>(
      builder: (context, model, child) => Row(children: [
        Flexible(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          model.changeActive(1);
                        },
                        child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: model.activequestion == 1
                                ? Colors.teal
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                              child: Text(
                            'New inspiction Question',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          model.changeActive(2);
                        },
                        child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: model.activequestion == 2
                                ? Colors.teal
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                              child: Text(
                            'Review inspiction Question',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          model.changeActive(3);
                        },
                        child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: model.activequestion == 3
                                ? Colors.teal
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                              child: Text(
                            "Renewal inspiction Question",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 10.h, right: 40.w, bottom: 10.h, left: 40.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          model.generateCSV();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r))),
                          height: 30.h,
                          width: 150.w,
                          child: Center(
                            child: Text(
                              'Export to CSV',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40.h,
                        width: 600.w,
                        child: GestureDetector(
                          onTap: () {
                            // model.generateCSV();
                          },
                          child: cstListBox(
                            onchanged: (String? newValue) {
                              print('value is $newValue');
                              model.filterQuestion(newValue);
                              // model.newQuestionModel.mainGroup = newValue;
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
                            hint: 'Sort by Main Group',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 780.h,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: model.activequestion == 1
                      ? model.newQuestionList.length
                      : model.activequestion == 2
                          ? model.reviewQuestionList.length
                          : model.renewlQuestionList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.r),
                        child: SizedBox(
                          height: 50.h,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 75.w),
                                  child: SizedBox(
                                      width: 30.w,
                                      child:
                                          Center(child: Text('${index + 1}'))),
                                ),
                                SizedBox(
                                  // color: Colors.amber,
                                  width: 1200.w,
                                  child: Text(
                                    model.activequestion == 1
                                        ? '${model.newQuestionList[index].question}'
                                        : model.activequestion == 2
                                            ? '${model.reviewQuestionList[index].question}'
                                            : '${model.renewlQuestionList[index].question}',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 40.w),
                                  child: SizedBox(
                                    child: model.loader
                                        ? CircularProgressIndicator()
                                        : Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    model.activequestion == 1
                                                        ? print(
                                                            '${model.newQuestionList[index].id}')
                                                        : model.activequestion ==
                                                                2
                                                            ? print(
                                                                '${model.reviewQuestionList[index].id}')
                                                            : print(
                                                                '${model.renewlQuestionList[index].id}');
                                                  },
                                                  icon: const Icon(
                                                    Icons.edit,
                                                    color: Colors.red,
                                                  )

                                                  //remove_circle_outline
                                                  ),
                                              IconButton(
                                                  onPressed: () {
                                                    String id = model
                                                                .activequestion ==
                                                            1
                                                        ? model
                                                            .newQuestionList[
                                                                index]
                                                            .id!
                                                        : model.activequestion ==
                                                                2
                                                            ? model
                                                                .reviewQuestionList[
                                                                    index]
                                                                .id!
                                                            : model
                                                                .renewlQuestionList[
                                                                    index]
                                                                .id!;
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return Customdailog(
                                                          picture: Icon(
                                                              Icons.delete,
                                                              size: 100.sp,
                                                              color:
                                                                  Colors.red),
                                                          ontap: () {
                                                            model
                                                                .DeleteQuestion(
                                                                    id);
                                                            Get.back();
                                                          },
                                                          ontap2: () {
                                                            Get.back();
                                                          },
                                                          text:
                                                              'Delete Question',
                                                          subtext:
                                                              ' Do you want to delete this question?',
                                                          buttonText: 'Delete',
                                                          btn2text: 'Cancel',
                                                        );
                                                      },
                                                    );
                                                  },
                                                  icon:
                                                      const Icon(Icons.delete))
                                            ],
                                          ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
