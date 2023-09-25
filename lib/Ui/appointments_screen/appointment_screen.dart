import 'package:englishtalkedesktop/Ui/side_bar.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        SideBar(),
        Expanded(
          child: Container(
            color: Colors.cyanAccent,
          ),
        ),
      ],
    ));
  }
}
