// ignore_for_file: must_be_immutable, prefer_const_constructors, unnecessary_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:mobile_project/Views/WelcomeScreen_views.dart';
class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context){

    Future.delayed(Duration(seconds: 5)).then((value){
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => WelcomePage(),
      ),
      (route) => false);
    }); 
    return Scaffold(
     body: Container(
      height: 2560.0, // Tinggi dalam pixel
      width: 1440.0, // Lebar dalam pixel
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Images/cafe.png'),
          fit: BoxFit.fill,
        ),
      ),
    ),
    );
  }
}
