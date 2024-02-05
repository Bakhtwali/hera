import 'package:englishtalkedesktop/core/model/institute_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class InstittuionProfile extends StatelessWidget {
  InstituteProfileModel model;
  InstittuionProfile({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        // color: Colors.amber,
        width: MediaQuery.of(context).size.width / 1.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15.h),
            model.instituteName == null
                ? ClipOval(
                    child: Image.network(
                      '${model.instituteLogo}',
                      height: 290.h,
                      width: 300.w,
                      fit: BoxFit.cover,
                    ),
                  )
                : ClipOval(
                    child: Image.asset(
                      'assets/dashboard.jpeg',
                      height: 290.h,
                      width: 300.w,
                      fit: BoxFit.cover,
                    ),
                  ),
            SizedBox(height: 35.h),
            Text(
              ' ${model.instituteName}',
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 5.h),
            Text(
              '${model.ownerName ?? "not available"}',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5.h),
            Text(
              '${model.whatsappNumber}',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            Text(
              '${model.completeAddress}',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15.h),
            Container(
              height: 100.h,
              width: 1000.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Colors.teal),
                // color: Colors.teal,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 10.h),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(.2),
                            borderRadius: BorderRadius.circular(50.r),
                            border:
                                Border.all(color: Colors.teal.withOpacity(.5)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5.r),
                            child: Icon(
                              Icons.man,
                              size: 30.sp,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          '${model.totalNmdStudents ?? 0}',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 10.h),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(.2),
                            borderRadius: BorderRadius.circular(50.r),
                            border:
                                Border.all(color: Colors.teal.withOpacity(.5)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5.r),
                            child: Icon(
                              Icons.school_outlined,
                              size: 30.sp,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          '${model.totalScholarshipadvertised ?? 0}',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
