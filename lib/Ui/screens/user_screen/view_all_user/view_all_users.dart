import 'package:englishtalkedesktop/Ui/screens/user_screen/view_all_user/view_all_user_provider.dart';
import 'package:englishtalkedesktop/core/custom_widgets/custom_dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ViewAllUsers extends StatefulWidget {
  const ViewAllUsers({Key? key}) : super(key: key);

  @override
  State<ViewAllUsers> createState() => _ViewAllUsersState();
}

class _ViewAllUsersState extends State<ViewAllUsers> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, model, child) => Row(
        children: [
          Expanded(
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
                SizedBox(height: 20.h),
                SizedBox(
                  height: 780.h,
                  child: Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: model.allUser
                          .length, // Replace numberOfRows with the actual number of rows
                      itemBuilder: (BuildContext context, int index) {
                        return model.loaderid == model.allUser[index].id
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : SizedBox(
                                width: MediaQuery.of(context)
                                    .size
                                    .width, // Adjust width as needed
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.r),
                                    child: SizedBox(
                                      height: 50.h,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 75.w),
                                              child: SizedBox(
                                                  width: 30.w,
                                                  child: Center(
                                                      child: Text(
                                                          '${index + 1}'))),
                                            ),
                                            SizedBox(
                                              width: 100.w,
                                              child: Center(
                                                child: Text(
                                                    '${model.allUser[index].name}'),
                                              ),
                                            ),
                                            SizedBox(
                                                width: 150.w,
                                                child:
                                                    Center(child: Text('5'))),
                                            SizedBox(
                                                width: 150.w,
                                                child:
                                                    Center(child: Text('2'))),
                                            SizedBox(
                                                width: 150.w,
                                                child:
                                                    Center(child: Text('9'))),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 40.w),
                                              child: SizedBox(
                                                child: Row(
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          String status = model
                                                                  .allUser[
                                                                      index]
                                                                  .isUserBlocked!
                                                              ? 'unblock'
                                                              : 'block';
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return Customdailog(
                                                                picture: model
                                                                        .allUser[
                                                                            index]
                                                                        .isUserBlocked!
                                                                    ? const Icon(
                                                                        Icons
                                                                            .block,
                                                                        color: Colors
                                                                            .teal,
                                                                      )
                                                                    : const Icon(
                                                                        Icons
                                                                            .remove_circle_outline,
                                                                        color: Colors
                                                                            .red,
                                                                      ),
                                                                ontap: () {
                                                                  model.blockFunction(
                                                                      model
                                                                          .allUser[
                                                                              index]
                                                                          .id,
                                                                      model
                                                                          .allUser[
                                                                              index]
                                                                          .isUserBlocked!);

                                                                  model
                                                                      .loaderfunction(
                                                                    model
                                                                        .allUser[
                                                                            index]
                                                                        .id,
                                                                  );

                                                                  Get.back();
                                                                },
                                                                ontap2: () {
                                                                  Get.back();
                                                                },
                                                                text:
                                                                    '${model.allUser[index].name}',
                                                                subtext:
                                                                    ' Do you want to $status this user?',
                                                                buttonText:
                                                                    '$status',
                                                                btn2text:
                                                                    'Cancel',
                                                              );
                                                            },
                                                          );
                                                        
                                                        
                                                        },
                                                        icon: model
                                                                .allUser[index]
                                                                .isUserBlocked!
                                                            ? const Icon(
                                                                Icons.block,
                                                                color:
                                                                    Colors.teal,
                                                              )
                                                            : const Icon(
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
                                                        icon: const Icon(
                                                            Icons.delete))
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
