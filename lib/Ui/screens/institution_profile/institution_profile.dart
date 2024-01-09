// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:englishtalkedesktop/Ui/custom_widget/custom_dailog/delet_dailog.dart';
import 'package:englishtalkedesktop/Ui/screens/institution_profile/add_institution/add_institution.dart';
import 'package:englishtalkedesktop/Ui/screens/institution_profile/institution_profile_provider.dart';
import 'package:englishtalkedesktop/Ui/screens/institution_profile/show_all_institution/show_all_institution.dart';
import 'package:englishtalkedesktop/Ui/screens/side_bar.dart';
import 'package:englishtalkedesktop/core/custom_widgets/SizedBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class InstitutionProfile extends StatefulWidget {
  @override
  State<InstitutionProfile> createState() => _InstitutionProfileState();
}

class _InstitutionProfileState extends State<InstitutionProfile> {
  @override
  @override
  Widget build(BuildContext context) {
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.28,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 20.w),
                            child: Container(
                              height: 119.h,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 0,
                                      offset: Offset(
                                          0, 0), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        model.changeActive(1);
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              CustomSizedBox(width: 30.w),
                                              CustomText(
                                                text: 'Add New Institute',
                                                fontSized: 24.sp,
                                                color: model.isActive
                                                    ? Colors.black
                                                    : Colors.grey,
                                              ),
                                            ],
                                          ),
                                          CustomSizedBox(height: 30.h),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 50.w),
                                            child: Container(
                                              width: 270.w,
                                              height: 5.h,
                                              decoration: BoxDecoration(
                                                  color: model.isActive
                                                      ? Colors.teal
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.r))),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        model.changeActive(2);
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              CustomSizedBox(width: 30.w),
                                              CustomText(
                                                text: 'View All Institute',
                                                fontSized: 24.sp,
                                                color: model.isActive
                                                    ? Colors.grey
                                                    : Colors.black,
                                              ),
                                            ],
                                          ),
                                          CustomSizedBox(height: 30.h),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 80.w),
                                            child: Container(
                                              width: 290.w,
                                              height: 5.h,
                                              decoration: BoxDecoration(
                                                  color: model.isActive
                                                      ? Colors.transparent
                                                      : Colors.teal,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.r))),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          CustomSizedBox(height: 10.h),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    model.isActive
                        ? AddInstitutionProfile()
                        : ShowAllInstitutions(),
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

