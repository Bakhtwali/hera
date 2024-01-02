import 'package:englishtalkedesktop/Ui/screens/question_configuration/shoq_all_question/show_all_question_provider.dart';
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
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                            child: Text(
                          'New inspiction Question',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Expanded(
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                            child: Text(
                          'Review inspiction Question',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Expanded(
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                            child: Text(
                          "Renewal inspiction Question",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 780.h,
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: model.newQuestionList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.r),
                          child: SizedBox(
                            height: 50.h,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 75.w),
                                    child: SizedBox(
                                        width: 30.w,
                                        child: Center(
                                            child: Text('${index + 1}'))),
                                  ),
                                  SizedBox(
                                    // color: Colors.amber,
                                    width: 1200.w,
                                    child: Text(
                                      '${model.newQuestionList[index].question}',
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 40.w),
                                    child: SizedBox(
                                      child: Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.edit,
                                                color: Colors.red,
                                              )

                                              //remove_circle_outline
                                              ),
                                          IconButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Customdailog(
                                                      picture: Icon(
                                                          Icons.delete,
                                                          size: 100.sp,
                                                          color: Colors.red),
                                                      ontap: () {
                                                        Get.back();
                                                      },
                                                      ontap2: () {
                                                        Get.back();
                                                      },
                                                      text: 'Delete Question',
                                                      subtext:
                                                          ' Do you want to delete this question?',
                                                      buttonText: 'Delete',
                                                      btn2text: 'Cancel',
                                                    );
                                                  },
                                                );
                                              },
                                              icon: const Icon(Icons.delete))
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
              ),
            ],
          ),
        )
      ]),
    );
  }
}
