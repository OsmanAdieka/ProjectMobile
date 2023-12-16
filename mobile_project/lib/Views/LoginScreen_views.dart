// ignore_for_file: must_be_immutable, prefer_const_constructors, unnecessary_import, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unused_import, sized_box_for_whitespace, non_constant_identifier_names, avoid_print, deprecated_member_use

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_project/Views/HomeScreen_views.dart';
import '../Controller/Auth_controller.dart';
import 'WelcomeScreen_views.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var FocusNodeEmail = FocusNode();
  var FocusNodePassword = FocusNode();
  bool isFocusedEmail = false;
  bool isFocusedPassword = false;
  final AuthController _authController = Get.put(AuthController());

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                    );
                  },
                  icon: Icon(Icons.arrow_back_rounded),
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Let\'s Sign You In',
                    style: GoogleFonts.tiltNeon(
                        fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Welcome Back',
                    style: GoogleFonts.tiltNeon(
                        fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'We\'ve Been Looking For You',
                    style: GoogleFonts.tiltNeon(
                        fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 60),
              const Text(
                'Email',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              TextField(
                controller: _emailController,
                style: GoogleFonts.tiltNeon(fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: 'Your Email',
                  errorText: isFocusedEmail
                      ? (_emailController.text.isEmpty
                          ? 'Email cannot be empty'
                          : !_emailController.text.contains('@gmail.com')
                              ? 'Invalid email format'
                              : null)
                      : null,
                ),
                focusNode: FocusNodeEmail,
                onChanged: (value) {
                  setState(() {
                    isFocusedEmail = true;
                  });
                },
              ),
              SizedBox(height: 10),
              const Text(
                'Password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              TextField(
                controller: _passwordController,
                obscureText: !isPasswordVisible,
                style: GoogleFonts.tiltNeon(fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  hintText: 'Your Password',
                  errorText: isFocusedPassword
                      ? (_passwordController.text.isEmpty
                          ? 'Password cannot be empty'
                          : null)
                      : null,
                ),
                focusNode: FocusNodePassword,
                onChanged: (value) {
                  setState(() {
                    isFocusedPassword = true;
                  });
                },
              ),
              SizedBox(height: 20),
              Obx(() {
                return ElevatedButton(
                  onPressed: _authController.isLoading.value
                      ? null
                      : () async {
                          if (_emailController.text.isNotEmpty &&
                              _emailController.text.contains('@gmail.com') &&
                              _passwordController.text.isNotEmpty) {
                            try {
                              await _authController.loginUser(
                                _emailController.text,
                                _passwordController.text,
                              );
                            } catch (e) {
                              // Handle login error
                              print('Login error: $e');
                              // Show error message to the user
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Invalid email or password'),
                                ),
                              );
                            }
                          } else {
                            // Handle invalid input, show error messages, etc.
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF372E1D),
                    onPrimary: Color.fromARGB(255, 255, 255, 255),
                    elevation: 0,
                    textStyle: GoogleFonts.tiltNeon(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _authController.isLoading.value
                      ? CircularProgressIndicator()
                      : Center(
                          child: Text('Let\'s Start Brewing'),
                        ),
                );
              }),
              SizedBox(height: 10),
               Center(
        child: ElevatedButton.icon(
          onPressed: () async {
            User? user = await _handleGoogleSignIn();
            if (user != null) {
              // Google Sign-In successful, proceed with your logic
              // For example, navigate to another screen or update UI
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()), // Replace HomePage with your actual home page widget
              );
            }
        },
                icon: Center(
                  child: Image.asset(
                    'assets/Images/google.png', // Replace with the path to your Google icon image
                    width: 24, // Adjust width as needed
                    height: 24, // Adjust height as needed
                  ),
                ),
                label: Text('Sign in with Google', style: TextStyle(color: Colors.black),),
              ),
               ),
              SizedBox(height: 20),
              // Animasi Rive di bawah tombol
              Container(
                width: double.infinity,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/Images/latbel_coffee.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<User?> _handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        // The user canceled the sign-in process
        return null;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential authResult = await _auth.signInWithCredential(credential);
      User? user = authResult.user;

      // You can now use the 'user' object to get user information
      print(
          'Google Sign-In Successful! User ID: ${user?.uid}, Email: ${user?.email}');

      return user;
    } catch (error) {
      print('Google Sign-In Error: $error');
      return null;
    }
  }
}
