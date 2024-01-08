import 'package:englishtalkedesktop/Ui/screens/dashboard.dart/dashboard_screen.dart';
import 'package:englishtalkedesktop/Ui/screens/institution_profile/institution_profile.dart';
import 'package:englishtalkedesktop/Ui/screens/app_submission_screen/app_submission.dart';
import 'package:englishtalkedesktop/Ui/screens/user_screen/create_user_screen/create_user_screen.dart';
import 'package:englishtalkedesktop/Ui/screens/user_screen/view_all_user/view_all_users.dart';
import 'package:englishtalkedesktop/Ui/screens/question_configuration/questionare.dart';
import 'package:englishtalkedesktop/Ui/screens/question_configuration/new_question_screen/new_question_screen.dart';
import 'package:englishtalkedesktop/Ui/screens/question_configuration/show_all_question/show_all_question.dart';
import 'package:englishtalkedesktop/Ui/screens/user_screen/user_screen.dart';
import 'package:englishtalkedesktop/core/Constants/constants.dart';
import 'package:englishtalkedesktop/core/custom_widgets/SizedBox.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/Constants/images.dart';

class SideBar extends StatefulWidget {
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool _isQuestionConfigExpanded = false;
  SideBarModel? _selectedItem;

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
          CustomSizedBox(height: 20.h),
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
                // bool isQuestionConfig =
                //     sidebarPage[index].text == 'Question Configuration';
                // print('this is ${sidebarPage[index].text}');
                // if (isQuestionConfig) {
                //   return Column(
                //     children: [
                //       ListTile(
                //         leading: Image.asset(
                //           sidebarPage[index].Image,
                //           height: 34.h,
                //           width: 32.w,
                //           color: active ? kAmberColor : KGrayColorForDashboard,
                //         ),
                //         title: ClipPath(
                //           child: Container(
                //             height: 50.h,
                //             width: 270.w,
                //             color: active
                //                 ? Colors.transparent
                //                 : Color.fromARGB(0, 39, 50, 145),
                //             child: Padding(
                //               padding: EdgeInsets.only(left: 10.w, top: 10.h),
                //               child: CustomText(
                //                 text: sidebarPage[index].text,
                //                 color: active
                //                     ? Colors.black
                //                     : KGrayColorForDashboard,
                //               ),
                //             ),
                //           ),
                //         ),
                //         onTap: () {
                //           setState(() {
                //             if (_selectedItem?.text ==
                //                 sidebarPage[index].text) {
                //               _isQuestionConfigExpanded =
                //                   !_isQuestionConfigExpanded;
                //             } else {
                //               _isQuestionConfigExpanded = true;
                //               _selectedItem = sidebarPage[index];
                //             }
                //           });
                //           if (sidebarPage[index].text == 'Screen 1') {
                //             Get.toNamed('/screen1');
                //           } else {
                //             Get.toNamed(sidebarPage[index].route);
                //           }
                //         },
                //       ),
                //       if (_isQuestionConfigExpanded)
                //         Padding(
                //           padding: EdgeInsets.symmetric(
                //               horizontal: 16.0), // Adjust the padding as needed
                //           child: Column(
                //             children: [
                //               Center(
                //                 child: ListTile(
                //                   leading:
                //                       Icon(Icons.settings), // Icon added here
                //                   title: Text('Adding New Question ',
                //                       style: TextStyle(fontSize: 10)),
                //                   onTap: () {
                //                     Get.toNamed('/screen1');
                //                   },
                //                 ),
                //               ),
                //               ListTile(
                //                 leading: Icon(Icons.list), // Icon added here
                //                 title: Text(
                //                   'View All Questions',
                //                   style: TextStyle(fontSize: 10),
                //                 ),
                //                 onTap: () {
                //                   Get.toNamed('/screen2');
                //                 },
                //               ),
                //               ListTile(
                //                 leading: Icon(Icons
                //                     .swap_horizontal_circle), // Icon added here
                //                 title: Text(
                //                   'Question(s) Swapping',
                //                   style: TextStyle(fontSize: 10),
                //                 ),
                //                 onTap: () {
                //                   // Handle the onTap event here
                //                 },
                //               ),
                //             ],
                //           ),
                //         )
                //     ],
                //   );
                // } else {
                return ListTile(
                  leading: Image.asset(
                    sidebarPage[index].Image,
                    height: 34.h,
                    width: 32.w,
                    color: active ? kAmberColor : KGrayColorForDashboard,
                  ),
                  title: ClipPath(
                    child: Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: Container(
                        height: 70.h,
                        width: 270.w,
                        color: active
                            ? Colors.transparent
                            : Color.fromARGB(0, 39, 50, 145),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 10.h),
                          child: CustomText(
                            text: sidebarPage[index].text,
                            color:
                                active ? Colors.black : KGrayColorForDashboard,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedItem = sidebarPage[index];
                    });
                    Get.toNamed(sidebarPage[index].route);
                  },
                );
                // }
              },
            ),
          ),

          //new Item Adding
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
    page: () => InstitutionProfile(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: "/Home4Screen",
    page: () => CreateUser(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: "/screen2",
    page: () => ShowAllQuestion(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: "/screen1",
    page: () =>
        NewQuestionScreen(), // Replace 'Screen1' with the actual screen you want to open
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: "/appsubmission",
    page: () => appSubmssion(),
  ),
  GetPage(
    name: "/userscreen",
    page: () => UserScreen(),
  ),
];
List<SideBarModel> sidebarPage = [
  SideBarModel(text: "Dashboard", route: "/Home1", Image: Home),
  SideBarModel(text: "Question Configuration", route: "/Home2", Image: profile),
  SideBarModel(text: "Institutions Profile", route: "/Home3", Image: tick_icon),
  // SideBarModel(text: "Create User", route: "/Home4Screen", Image: message),
  SideBarModel(text: "View All Users", route: "/userscreen", Image: tick_icon),
  SideBarModel(
      text: "App Submission Configuration",
      route: "/appsubmission",
      Image: message),
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
