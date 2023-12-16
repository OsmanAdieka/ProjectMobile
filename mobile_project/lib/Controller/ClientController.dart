
// ClientController.dart
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  late Client client;

  @override
  void onInit() {
    super.onInit();

    client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('656707c5b0ab98f584e8')
        .setSelfSigned(status: true); // For self signed certificates, only use for development
  }
}


