// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:englishtalkedesktop/Ui/side_bar.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Questionare extends StatelessWidget {
  Questionare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        SideBar(),
        Expanded(
            child: Column(
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
                          DateFormat('EEE MMM d yyyy').format(DateTime.now()),
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
          ],
        )),
      ],
    ));
  }
}
