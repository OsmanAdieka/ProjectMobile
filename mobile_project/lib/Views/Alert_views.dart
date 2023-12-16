// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class CustomAlertDialog {
  static void show(BuildContext context, VoidCallback onPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
  color: Colors.white,
  width: double.maxFinite,
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        'assets/Gif/happycat.gif', 
        width: 100,
        height: 100,
      ),
      SizedBox(height: 10),
      Text('Thank You!!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF372E1D))),
    ],
  ),
)
        );
      },
    );
  }
}
