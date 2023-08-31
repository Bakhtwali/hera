// ignore_for_file: prefer_const_constructors

import 'package:englishtalkedesktop/Ui/appointments_screen/appointment_screen.dart';
import 'package:englishtalkedesktop/Ui/dashboard.dart/dashboard_screen.dart';
import 'package:englishtalkedesktop/Ui/requests_screen/request_sreen.dart';
import 'package:englishtalkedesktop/Ui/question_configuration/questionare.dart';
import 'package:englishtalkedesktop/core/Constants/constants.dart';
import 'package:englishtalkedesktop/core/custom_widgets/SizedBox.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/Constants/images.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool _isQuestionConfigExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 255, 255, 255)),
        width: 350.w,
        child: Column(children: [
          CustomSizedBox(height: 45.h),
          Container(
            //color: Colors.red,
            width: 100,
            height: 100,
            child: Image.asset(
              'assets/hera-final.png',
              width: 100.w,
              height: 100.h,
            ),
          ),
          Text(
            'HERA',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.white,
            ),
          ),
          CustomSizedBox(height: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CustomText(
                  text: 'Main menu', color: KGrayColorForDashboard),
              Container(
                height: 8.h,
                width: 150.w,
                decoration: BoxDecoration(
                    color: kAmberColor,
                    borderRadius: BorderRadius.all(Radius.circular(20.r))),
              )
            ],
          ),
          CustomSizedBox(height: 60.h),
          Expanded(
              child: ListView.builder(
                  itemCount: sidebarPage.length,
                  itemBuilder: (context, index) {
                    bool active = Get.currentRoute == sidebarPage[index].route;
                    bool isQuestionConfig =
                        sidebarPage[index].text == 'Question Configuration';

                    if (isQuestionConfig) {
                      return Column(
                        children: [
                          ListTile(
                            leading: Image.asset(
                              sidebarPage[index].Image,
                              height: 34.h,
                              width: 32.w,
                              color:
                                  active ? kAmberColor : KGrayColorForDashboard,
                            ),
                            title: ClipPath(
                              child: Container(
                                height: 50.h,
                                width: 270.w,
                                color: active
                                    ? Colors.transparent
                                    : Color.fromARGB(0, 39, 50, 145),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.w, top: 10.h),
                                  child: CustomText(
                                    text: sidebarPage[index].text,
                                    color: active
                                        ? Colors.black
                                        : KGrayColorForDashboard,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _isQuestionConfigExpanded =
                                    !_isQuestionConfigExpanded;
                              });
                            },
                          ),
                          if (_isQuestionConfigExpanded)
                            ExpansionTile(
                              title: Column(
                                children: [
                                  Text('kk'),
                                ],
                              ),
                              children: [
                                ListTile(
                                  title: Text('Option 1'),
                                  onTap: () {
                                    // Handle Option 1 navigation
                                  },
                                ),
                                ListTile(
                                  title: Text('Option 2'),
                                  onTap: () {
                                    // Handle Option 2 navigation
                                  },
                                ),
                                // Add more options as needed
                              ],
                            ),
                        ],
                      );
                    } else {
                      return ListTile(
                        leading: Image.asset(
                          sidebarPage[index].Image,
                          height: 34.h,
                          width: 32.w,
                          color: active ? kAmberColor : KGrayColorForDashboard,
                        ),
                        title: ClipPath(
                          child: Container(
                            height: 50.h,
                            width: 270.w,
                            color: active
                                ? Colors.transparent
                                : Color.fromARGB(0, 39, 50, 145),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: CustomText(
                                text: sidebarPage[index].text,
                                color: active
                                    ? Colors.black
                                    : KGrayColorForDashboard,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(sidebarPage[index].route);
                        },
                      );
                    }
                  }))
        ]),
      ),
    );
  }
}

class SideBarModel {
  final String text;
  final String route;
  final Image;
  SideBarModel({required this.text, required this.route, this.Image});
}

List<GetPage> pages = [
  GetPage(
    name: "/Home1",
    page: () => DashboardScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: "/Home2",
    page: () => Questionare(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: "/Home3",
    page: () => RequestScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: "/Home4Screen",
    page: () => AppointmentScreen(),
    transition: Transition.fadeIn,
  ),
];
List<SideBarModel> sidebarPage = [
  SideBarModel(text: "Dashboard", route: "/Home1", Image: Home),
  SideBarModel(text: "Question Configuration", route: "/Home2", Image: profile),
  SideBarModel(text: "Institutions Profile", route: "/Home3", Image: tick_icon),
  SideBarModel(text: "Create User", route: "/Home4Screen", Image: message),
];

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(20, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
