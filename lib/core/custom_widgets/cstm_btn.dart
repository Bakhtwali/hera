import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final buttonTitle, onPress;
  const CustomButton({super.key, this.buttonTitle, this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF554279),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              buttonTitle,
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: "WorkSans"),
            ),
          )),
    );
  }
}
