// ignore_for_file: unnecessary_import, deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

// class ProfileController extends GetxController {
//   RxString imagePath = ''.obs;

//   Future<void> pickImage() async {
//     final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       imagePath.value = pickedFile.path;
//     }
//   }
// }

class ProfileController extends GetxController {
  RxString imagePath = ''.obs;

  Future<void> pickImage() async {
    final pickedFile = await Get.bottomSheet<int>(
      Container(
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose from gallery'),
              onTap: () {
                Get.back(result: 0);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take a picture'),
              onTap: () {
                Get.back(result: 1);
              },
            ),
          ],
        ),
      ),
    );

    if (pickedFile == null) {
      return; // User canceled the action
    }

    ImageSource source = pickedFile == 0
        ? ImageSource.gallery
        : ImageSource.camera;

    final pickedImage = await ImagePicker().getImage(source: source);

    if (pickedImage != null) {
      imagePath.value = pickedImage.path;
      updateProfile(); // Call the method to update the profile
    }
  }

  void updateProfile() {
    // Perform actions to update the profile with the new image
    // For example, you can make a network request or update local data
    print('Profile updated with image: ${imagePath.value}');
  }
}
