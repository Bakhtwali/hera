import 'package:englishtalkedesktop/Ui/side_bar.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        SideBar(),
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        ),
      ],
    ));
  }
}
