import 'package:englishtalkedesktop/Ui/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen2 extends StatefulWidget {
  @override
  State<Screen2> createState() => _Screen1State();
}

class _Screen1State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [
      SideBar(),
      Expanded(
          child: Container(
        child: Text("fhhhergrthy5t 2 ${Get.parameters}"),
      ))
    ]));
  }
}
