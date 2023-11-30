import 'package:englishtalkedesktop/Ui/question_configuration/create_user_screen/create_user_provider.dart';
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
    return ChangeNotifierProvider(
      create: (context) => CreateUserProvider(),
      child: Consumer<CreateUserProvider>(
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
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(100.0),
                            child: DataTable(
                              columns: [
                                dataColumn('S.No'),
                                dataColumn('User Name', flex: 100),
                                dataColumn('Inspection Assigned', flex: 100),
                                dataColumn('Completed', flex: 3),
                                dataColumn('Pending'),
                                dataColumn('Actions'),
                              ],
                              rows: [
                                dataRow(
                                  '1',
                                  'John Doe',
                                  '10',
                                  '5',
                                  '5',
                                ),
                                dataRow(
                                  '2',
                                  'Jane Smith',
                                  '15',
                                  '12',
                                  '3',
                                ),
                                // Add more data rows as needed...
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            model.createUserFunction();
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
      ),
    );
  }

  DataColumn dataColumn(String label, {int flex = 1}) {
    return DataColumn(
      label: Expanded(
        flex: flex,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  DataRow dataRow(
    String sNo,
    String userName,
    String totalAssigned,
    String totalCompleted,
    String totalPending,
  ) {
    return DataRow(
      cells: [
        dataCell(sNo),
        dataCell(userName),
        dataCell(totalAssigned),
        dataCell(totalCompleted),
        dataCell(totalPending),
        dataCellActions(),
      ],
    );
  }

  DataCell dataCell(String text) {
    return DataCell(
      Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }

  DataCell dataCellActions() {
    return DataCell(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              // View profile action
            },
            icon: Icon(Icons.visibility),
          ),
          IconButton(
            onPressed: () {
              // Edit action
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              // Delete action
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
