import 'package:englishtalkedesktop/Ui/side_bar.dart';
import 'package:englishtalkedesktop/core/custom_widgets/cstm_text_field.dart';
import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  @override
  State<Screen3> createState() => _Screen1State();
}

class _Screen1State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: (Column(
                children: [
                  CustomTextField(
                    labelText: 'Enter User Name',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    labelText: 'Enter Email',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    labelText: 'Enter Password',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    labelText: 'Enter Confirm Password',
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      const Spacer(), // Add Spacer to create equal space on the left
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Save Record'),
                      ),
                      SizedBox(
                        width: 8.0,
                      ), // Add Spacer to create equal space between buttons
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Update Record'),
                      ),
                      SizedBox(
                        width: 8.0,
                      ), // Add Spacer to create equal space between buttons
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Show All'),
                      ),
                      Spacer(), // Add Spacer to create equal space on the right
                    ],
                  )
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
