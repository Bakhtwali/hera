import 'package:englishtalkedesktop/Ui/question_configuration/create_user_screen/create_user_provider.dart';
import 'package:englishtalkedesktop/Ui/question_configuration/view_all_user/view_all_user_provider.dart';
import 'package:englishtalkedesktop/Ui/side_bar.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

class ViewAllUsers extends StatefulWidget {
  @override
  State<ViewAllUsers> createState() => _ViewAllUsersState();
}

class _ViewAllUsersState extends State<ViewAllUsers> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, model, child) => Scaffold(
        body: Row(
          children: [
            SideBar(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 40),
                  Text(
                    'View All User Screen',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
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
                                  child: Text(
                                'S.No',
                                style: TextStyle(fontSize: 16.sp),
                              )),
                              Container(
                                  child: Text(
                                'User Name',
                                style: TextStyle(fontSize: 16.sp),
                              )),
                              Text(
                                'Inspection Assigned',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              Text(
                                'Inspection Completed',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              Text(
                                'Inspection Pending',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              Text(
                                'Action',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              // Row(
                              //   children: [
                              //     IconButton(
                              //       onPressed: () {},
                              //       icon: Icon(Icons.edit),
                              //     ),
                              //     IconButton(
                              //         onPressed: () {},
                              //         icon: Icon(Icons.delete))
                              //   ],
                              // )
                            ]),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: model.allUser
                          .length, // Replace numberOfRows with the actual number of rows
                      itemBuilder: (BuildContext context, int index) {
                        return model.loaderid == model.allUser[index].id
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : SizedBox(
                                width: MediaQuery.of(context)
                                    .size
                                    .width, // Adjust width as needed
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50.h,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 75.w),
                                              child: Container(
                                                  width: 30.w,
                                                  child: Center(
                                                      child: Text(
                                                          '${index + 1}'))),
                                            ),
                                            Container(
                                              width: 100.w,
                                              child: Center(
                                                child: Text(
                                                    '${model.allUser[index].name}'),
                                              ),
                                            ),
                                            Container(
                                                width: 150.w,
                                                child: Center(
                                                    child: Text(
                                                        '048489939393934784884838383'))),
                                            Container(
                                                width: 150.w,
                                                child: Center(
                                                    child: Text('04939393'))),
                                            Container(
                                                width: 150.w,
                                                child:
                                                    Center(child: Text('0'))),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 40.w),
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return Customdailog(
                                                                picture: Icon(
                                                                    Icons.block,
                                                                    size:
                                                                        100.sp,
                                                                    color: Colors
                                                                        .red),
                                                                ontap: () {
                                                                  model.loaderfunction(model
                                                                      .allUser[
                                                                          index]
                                                                      .id);

                                                                  Get.back();
                                                                },
                                                                ontap2: () {
                                                                  Get.back();
                                                                },
                                                                text:
                                                                    '${model.allUser[index].name}',
                                                                subtext:
                                                                    ' Do you want to block this user?',
                                                                buttonText:
                                                                    'Block',
                                                                btn2text:
                                                                    'Cancel',
                                                              );
                                                            },
                                                          );
                                                        },
                                                        icon: model
                                                                .allUser[index]
                                                                .isUserBlocked!
                                                            ? Icon(
                                                                Icons.block,
                                                                color:
                                                                    Colors.teal,
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .remove_circle_outline,
                                                                color:
                                                                    Colors.red,
                                                              )

                                                        //remove_circle_outline
                                                        ),
                                                    IconButton(
                                                        onPressed: () {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return Customdailog(
                                                                picture: Icon(
                                                                    Icons
                                                                        .delete,
                                                                    size:
                                                                        100.sp,
                                                                    color: Colors
                                                                        .red),
                                                                ontap: () {
                                                                  model.loaderfunction(model
                                                                      .allUser[
                                                                          index]
                                                                      .id);
                                                                  model.deleteUser(
                                                                      model
                                                                          .allUser[
                                                                              index]
                                                                          .id!,
                                                                      model
                                                                          .allUser[
                                                                              index]
                                                                          .email!,
                                                                      model
                                                                          .allUser[
                                                                              index]
                                                                          .password!);
                                                                  Get.back();
                                                                },
                                                                ontap2: () {
                                                                  Get.back();
                                                                },
                                                                text:
                                                                    '${model.allUser[index].name}',
                                                                subtext:
                                                                    ' Do you want to delete this user permanently?',
                                                                buttonText:
                                                                    'Delete',
                                                                btn2text:
                                                                    'Cancel',
                                                              );
                                                            },
                                                          );
                                                        },
                                                        icon:
                                                            Icon(Icons.delete))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // model.createUserFunction();
                        },
                        child: Text('Login'),
                      ),
                      SizedBox(width: 10.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Dashboard'),
                      ),
                      SizedBox(width: 10.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Log Out'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
