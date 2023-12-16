// ignore_for_file: must_be_immutable, prefer_const_constructors, unnecessary_import, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unused_import, sized_box_for_whitespace, deprecated_member_use, sort_child_properties_last, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_project/Views/LoginScreen_views.dart';
import 'package:mobile_project/Views/WelcomeScreen_views.dart';
import '../Controller/Auth_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var FocusNodeEmail = FocusNode();
  var FocusNodePassword = FocusNode();
  bool isFocusedEmail = false;
  bool isFocusedPassword = false;

  bool isPasswordVisible = false;

  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  'Create an Account',
                  style: GoogleFonts.tiltNeon(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5),
                Text(
                  'Make sure the data is valid',
                  style: GoogleFonts.tiltNeon(fontSize: 25, fontWeight: FontWeight.w400),
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
                errorText: _emailController.text.isNotEmpty &&
                        !_emailController.text.contains('@gmail.com')
                    ? 'Invalid email format'
                    : null,
              ),
              focusNode: FocusNodeEmail,
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
                        : Icons.visibility_off_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                hintText: 'Your Password',
                errorText: _passwordController.text.isEmpty
                    ? 'Password cannot be empty'
                    : null,
              ),
              focusNode: FocusNodePassword,
            ),
            SizedBox(height: 10),
           Obx(() {
  return ElevatedButton(
    onPressed: _authController.isLoading.value
        ? null
        : () {
            if (_emailController.text.isNotEmpty &&
                _emailController.text.contains('@gmail.com') &&
                _passwordController.text.isNotEmpty) {
              _authController.registerUser(
                _emailController.text,
                _passwordController.text,
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            } else {
              // Handle invalid input, show error messages, etc.
            }
          },
          child: _authController.isLoading.value
              ? CircularProgressIndicator()
              : Text('Register'),
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
            minimumSize: Size(double.infinity, 40), // Set width to double.infinity
          ),
        );
      }),
            SizedBox(height: 20),
              // Animasi Rive di bawah tombol
              Container(
                width: double.infinity,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/Images/cat_coffe.jpg', // Corrected the image asset path
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
}
