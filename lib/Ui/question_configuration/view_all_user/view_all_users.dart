import 'package:englishtalkedesktop/Ui/question_configuration/create_user_screen/create_user_provider.dart';
import 'package:englishtalkedesktop/Ui/question_configuration/view_all_user/view_all_user_provider.dart';
import 'package:englishtalkedesktop/Ui/side_bar.dart';
import 'package:flutter/material.dart';
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
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('S.No'),
                              Text('User Name'),
                              Text('Inspection Assigned'),
                              Text('Inspection Completed'),
                              Text('Inspection Pending'),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.delete))
                                ],
                              )
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
                        return SizedBox(
                          width: MediaQuery.of(context)
                              .size
                              .width, // Adjust width as needed
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('${index + 1}'),
                                      Text('${model.allUser[index].name}'),
                                      Text('Inspection Assigned'),
                                      Text('Inspection Completed'),
                                      Text('Inspection Pending'),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.edit),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.delete))
                                        ],
                                      )
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
