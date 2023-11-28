// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final onChanged,
      validator,
      fillColor,
      initialVal,
      obscureText,
      keyBoardType,
      hintText,
      labelText;
  IconButton? suffixIcon;
  CustomTextField({
    this.onChanged,
    this.validator,
    this.fillColor,
    this.suffixIcon,
    this.keyBoardType,
    this.obscureText = false,
    this.initialVal,
    this.hintText,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      //padding: EdgeInsets.symmetric(horizontal: 10),
      /* decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF554279), width: 1),
        borderRadius: BorderRadius.circular(5),
      ),*/
      child: TextFormField(
        style: TextStyle(color: Colors.black, fontSize: 14),
        initialValue: initialVal,
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyBoardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          suffixIcon: suffixIcon,
          filled: fillColor,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          hintText: hintText,

          labelText: labelText,
          // errorBorder: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class cstListBox extends StatelessWidget {
  final List<String> values; // Pass the list of values as a parameter
  final String hint;

  const cstListBox({
    Key? key,
    required this.values,
    required this.hint, // Accept the list of values
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF554279), width: 0),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 60.0,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: InputBorder.none, // Set the border to none
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
        isDense: true,
        items: values.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          // Handle dropdown value change
        },
        hint: Text(hint),
      ),
    );
  }
}

class cstDatePicker extends StatelessWidget {
  final String hintText;
  final void Function(DateTime?) onDateSelected;

  const cstDatePicker({
    Key? key,
    required this.hintText,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 56.0,
      child: TextFormField(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (pickedDate != null) {
            onDateSelected(pickedDate);
          }
        },
        readOnly: true,
        decoration: InputDecoration(
          hintText: hintText,
          //border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
