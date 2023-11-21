// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:englishtalkedesktop/Ui/side_bar.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_button.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DateTime today = DateTime.now();

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
                Padding(
                  padding: const EdgeInsets.only(left: 100.0),
                  child: Row(
                    children: [
                      Dashboard_containers(
                          title: '100', subtitle: 'Inspection(s) Forwarded'),
                      SizedBox(width: 10.0),
                      Dashboard_containers(
                          title: '50', subtitle: 'Inspection(s) Completed'),
                      SizedBox(
                        width: 10.0,
                      ),
                      Dashboard_containers(
                          title: '50', subtitle: 'Inspection(s) Pending'),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Card(
                  child: Container(
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 700.w,
                            height: 750.h,
                            //color: Colors.red, // You can change the color as desired
                            child: TableCalendar(
                              focusedDay: today,
                              firstDay: DateTime.utc(2010, 10, 16),
                              lastDay: DateTime.utc(2099, 10, 16),
                            )),
                        SizedBox(
                          width: 700.w,
                          height: 750.h,
                          //color: Colors.grey.withOpacity(1.0),
                          child: PieChart(
                            PieChartData(
                              sections: [
                                PieChartSectionData(
                                  color: Colors.lightGreen.withOpacity(0.5),
                                  value: 50,
                                  title: 'Total Forwarded',
                                  radius: 120,
                                ),
                                PieChartSectionData(
                                  color: Colors.redAccent.withOpacity(0.5),
                                  value: 50,
                                  title: 'Pending',
                                  radius: 120,
                                ),
                                PieChartSectionData(
                                  color: Colors.blueAccent.withOpacity(0.5),
                                  value: 50,
                                  title: 'Completed',
                                  radius: 120,
                                ),
                                // Add a section for Total if needed
                              ],
                              centerSpaceRadius: 70,
                              sectionsSpace: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  //@override
  //void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //super.debugFillProperties(properties);
  //properties.add(DiagnosticsProperty<DateTime>('today', today));
  //}
}

class Dashboard_containers extends StatelessWidget {
  final String title;
  final String subtitle;

  Dashboard_containers({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(
                0, 2), // Adjust the values to control the shadow's position
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
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
