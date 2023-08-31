// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:englishtalkedesktop/Ui/side_bar.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
                // main column
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomContainer(
                      image: 'assets/asd.png', // Provide the correct image path
                      text1: 'Total',
                      text2: 'Institutions',
                      text3: '300',
                    ),
                    SizedBox(width: 20),
                    CustomContainer(
                      image: 'assets/asd.png', // Provide the correct image path
                      text1: 'Private',
                      text2: 'Colleges',
                      text3: '200',
                    ),
                    SizedBox(width: 20),
                    CustomContainer(
                      image: 'assets/asd.png', // Provide the correct image path
                      text1: 'Private',
                      text2: 'Medical Colleges',
                      text3: '14',
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20),
                    CustomContainer(
                      image: 'assets/asd.png', // Provide the correct image path
                      text1: 'Private',
                      text2: 'Uniersities',
                      text3: '10',
                    ),
                    SizedBox(width: 20),
                    CustomContainer(
                      image: 'assets/asd.png', // Provide the correct image path
                      text1: 'Text 1',
                      text2: 'Text 2',
                      text3: 'Text 3',
                    ),
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

class CustomContainer extends StatelessWidget {
  final String image;
  final String text1;
  final String? text2;
  final String? text3;

  CustomContainer({
    required this.image,
    required this.text1,
    this.text2,
    this.text3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 100.h,
      width: 350.w,
      child: Row(
        children: [
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 50,
                width: 50,
                color: Colors.transparent,
              ),
            ],
          ),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start, // Adjust alignment
            children: [
              Flexible(child: Text(text1)),
              if (text2 != null) Flexible(child: Text(text2!)),
              if (text3 != null) Text(text3!),
            ],
          )
        ],
      ),
    );
  }
}
