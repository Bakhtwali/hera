import 'package:englishtalkedesktop/Ui/side_bar.dart';
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
            child: (Text('Hello orld')),
          )
        ],
      ),
    );
  }
}
