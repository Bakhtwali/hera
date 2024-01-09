import 'package:englishtalkedesktop/Ui/screens/institution_profile/show_all_institution/show_all_institution_provider.dart';
import 'package:englishtalkedesktop/Ui/screens/question_configuration/show_all_question/show_all_question_provider.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ShowAllInstitutions extends StatefulWidget {
  const ShowAllInstitutions({Key? key}) : super(key: key);

  @override
  State<ShowAllInstitutions> createState() => _Screen1State();
}

class _Screen1State extends State<ShowAllInstitutions> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShowAllInstitutionProvider>(
      builder: (context, model, child) => Row(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.28,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Colors.teal,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    height: 50.h,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              // color: Colors.amber,
                              child: Text(
                            'S.No',
                            style: TextStyle(fontSize: 16.sp),
                          )),
                          Container(
                              // color: Colors.amber,/
                              child: Text(
                            'Name',
                            style: TextStyle(fontSize: 16.sp),
                          )),
                          Text(
                            'District',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          Text(
                            'Institution type',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          Text(
                            'Discipine type',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          Text(
                            'Action',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ]),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 780.h,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: model.instituteProfileModelList
                      .length, // Replace numberOfRows with the actual number of rows
                  itemBuilder: (BuildContext context, int index) {
                    return
                        // model.loaderid == model.allUser[index].id
                        //     ? const Center(
                        //         child: CircularProgressIndicator(),
                        //       )
                        //     :
                        Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.r),
                        child: SizedBox(
                          height: 50.h,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 95.w),
                                  child: SizedBox(
                                      width: 10.w,
                                      child:
                                          Center(child: Text('${index + 1}'))),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 25.w),
                                  child: SizedBox(
                                    width: 100.w,
                                    child: Center(
                                      child: Text(
                                          '${model.instituteProfileModelList[index].instituteName}'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width: 150.w,
                                    child: Center(
                                        child: Text(
                                            '${model.instituteProfileModelList[index].district}'))),
                                SizedBox(
                                    width: 150.w,
                                    child: Center(
                                        child: Text(
                                            '${model.instituteProfileModelList[index].instituteType}'))),
                                SizedBox(
                                    width: 150.w,
                                    child: Center(
                                        child: Text(
                                            '${model.instituteProfileModelList[index].displineType}'))),
                                Padding(
                                  padding: EdgeInsets.only(right: 40.w),
                                  child: SizedBox(
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              // String status = model
                                              //         .allUser[index]
                                              //         .isUserBlocked!
                                              //     ? 'unblock'
                                              //     :
                                              'block';
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Customdailog(
                                                    picture: const Icon(
                                                      Icons.remove_red_eye,
                                                      color: Colors.red,
                                                    ),
                                                    ontap: () {
                                                      Get.back();
                                                    },
                                                    ontap2: () {
                                                      Get.back();
                                                    },
                                                    text: 'name}',
                                                    subtext:
                                                        ' Do you want to status this user?',
                                                    buttonText: 'status',
                                                    btn2text: 'Cancel',
                                                  );
                                                },
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.remove_red_eye,
                                              color: Colors.teal,
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
                                                    picture: Icon(Icons.delete,
                                                        size: 100.sp,
                                                        color: Colors.red),
                                                    ontap: () {
                                                      Get.back();
                                                    },
                                                    ontap2: () {
                                                      Get.back();
                                                    },
                                                    text: 'name}',
                                                    subtext:
                                                        ' Do you want to delete this user permanently?',
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
            ],
          ),
        )
      ]),
    );
  }
}
