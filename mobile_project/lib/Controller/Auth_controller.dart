// ignore_for_file: use_build_context_synchronously, avoid_print, non_constant_identifier_names, prefer_const_constructors, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Views/HomeScreen_views.dart';
import '../Views/LoginScreen_views.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class AuthController extends GetxController{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

Future<void> registerUser(String email, String password) async {
 try {
  isLoading.value = true;
    await _auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
    );
    Get.snackbar('Success', 'Registration successful',
      backgroundColor: Colors.green);
    Get.off(LoginPage()); //Navigate ke Login Page
    } catch (error) {
    Get.snackbar('Error', 'Registration failed: $error',
  backgroundColor: Colors.red);
  } finally {
  isLoading.value = false;
   }
  }
  
 Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('Success', 'Login Successful');
      Get.off(HomeScreen());
    } catch (error) {
      print('Login error: $error');
      Get.snackbar('Error', 'Login failed');
    } finally {
      isLoading.value = false;
    }
  }


  void logout(BuildContext context) async {
  try {
    await _auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  } catch (e) {
    print("Logout Error: $e");
  }
}

}
