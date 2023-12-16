// ignore_for_file: must_be_immutable, prefer_const_constructors, unnecessary_import, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:io';
import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Controller/Auth_controller.dart';
import '../Controller/profile_ImagePicker_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Instagram_views.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Profile extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(FeatherIcons.instagram),
            onPressed: () {
              // Open Instagram in a WebView
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InstagramWebView(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.message_sharp),
            onPressed: () async {
              String? token = await FirebaseMessaging.instance.getToken();
              print(token);
            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _showLogoutConfirmation(context);
            },
          ),
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => controller.pickImage(),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: controller.imagePath.value.isNotEmpty
                            ? FileImage(File(controller.imagePath.value))
                            : null,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Text(
                  'Your information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(fontSize: 13),
                              ),
                              SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kelompok 8',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 20),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Birthday',
                                style: TextStyle(fontSize: 13),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '30 Feb 1520',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                buildInfoColumn('Email', 'YKK@gmail.com'),
                buildInfoColumn('Phone', '0812-3456-7890'),
                buildInfoColumn('Location', 'NewYork, Indonesia'),
                SizedBox(height: 30),
                // Tambahkan teks "DEV"
                Center(
                  child: Text(
                    'THE DEVELOPERS',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDeveloperInfo(
                        'assets/Images/d1.jpeg',
                        'SORRY YA AKU BERGADANG, THIS IS COKA COWO INFORMATIKA',
                        50.0, 12.0, 'https://www.instagram.com/ozman_ad?igshid=OGQ5ZDc2ODk2ZA=='),
                    SizedBox(width: 10), // Jarak antara gambar dan teks
                  ],
                ),
                SizedBox(height: 20), // Jarak antara baris gambar
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDeveloperInfo('assets/Images/d2.jpeg',
                        'YG INI AGAK JAIL SUKA NGOTAK-NGATIK TRUS TIBA" SUKA KTAWA SENDIRI', 
                        50.0, 12.0, 'https://www.instagram.com/risma.nissa?igshid=OGQ5ZDc2ODk2ZA=='),
                    SizedBox(width: 10), // Jarak antara gambar dan teks
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDeveloperInfo(
                        'assets/Images/d3.jpeg',
                        'INI PALING KALEM, SEKALINYA GERAK BIKIN HEBOH (PROGRAMNYA ERROR SMUA)',
                        50.0, 12.0, 'https://www.instagram.com/tar0.png?igshid=OGQ5ZDc2ODk2ZA=='),
                    SizedBox(width: 10), // Jarak antara gambar dan teks
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeveloperInfo(String imagePath, String developerName, double imageSize, double fontSize, String instagramUrl) {
    return Expanded(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              // Navigasi ke URL Instagram
              launch(instagramUrl);
            },
            child: Stack(
              children: [
                CircleAvatar(
                  radius: imageSize,
                  backgroundImage: AssetImage(imagePath),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      FeatherIcons.instagram,
                      color: Colors.pink, // Ganti warna sesuai kebutuhan
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Text(
            developerName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }


  Widget buildInfoColumn(String title, String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 13),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.info,
                size: 16,
                color: Colors.grey,
              ),
              SizedBox(width: 5),
              Text(
                value,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout ?", textAlign: TextAlign.center),
          content:
              Text("Sure you want to log out?", textAlign: TextAlign.center),
          contentPadding: EdgeInsets.all(20.0), // Atur padding konten
          backgroundColor: Colors.grey, // Atur warna latar belakang dialog
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Atur sudut border dialog
          ),
          actions: [
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Tutup dialog
                      _authController.logout(context); // Lakukan logout
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors
                          .white, // Warna latar belakang tombol (jika tidak diatur, maka akan mengikuti tema)
                    ),
                    child: Text(
                      "Yes",
                      style: TextStyle(
                        color: Colors.black, // Warna teks
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Tutup dialog
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors
                          .white, // Warna latar belakang tombol (jika tidak diatur, maka akan mengikuti tema)
                    ),
                    child: Text(
                      "No",
                      style: TextStyle(
                        color: Colors.black, // Warna teks
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
