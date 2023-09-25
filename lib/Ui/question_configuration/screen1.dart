import 'package:englishtalkedesktop/Ui/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen1 extends StatefulWidget {
  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [
      SideBar(),
      Expanded(
          child: Container(
        child: Text("fhhh ${Get.parameters}"),
      ))
    ]));
  }
}
