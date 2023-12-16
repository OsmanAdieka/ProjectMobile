// ignore_for_file: must_be_immutable, prefer_const_constructors, unnecessary_import, use_key_in_widget_constructors, deprecated_member_use, sort_child_properties_last, unused_import


import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_project/Views/LoginScreen_views.dart';
import 'package:mobile_project/Views/RegisterScreen_views.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Images/latbel_coffee2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: 200,  // Gantilah desiredWidth dengan nilai yang sesuai
            height: 200, // Gantilah desiredHeight dengan nilai yang sesuai
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/Images/cafe2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
              SizedBox(
                height: 180,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  'The Book Cafe by Coffee Cat',
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  style: GoogleFonts.tiltNeon(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF372E1D),
                  ),
                ),
                SizedBox(width: 8), // Jarak antara teks dan logo
                Icon(
                  Icons.pets, // Ganti dengan ikon yang Anda inginkan
                  size: 20,
                  color: Color(0xFF372E1D),
                )
              ]
                      ),
                
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Hi! Before you get started, please sign in into your account!',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.tiltNeon(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => LoginPage()),
                                      );
                                    },
                                    child: Text('Sign In'),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      textStyle: GoogleFonts.tiltNeon(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                      primary: Color(0xFF372E1D),
                                      onPrimary: Color.fromARGB(255, 255, 255, 255),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      foregroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RegisterPage()),
                                );
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
