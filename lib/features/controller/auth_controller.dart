import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final phoneNumber = ''.obs;
  final phoneError = ''.obs;

  void updatePhoneNumber(String value) => phoneNumber.value = value;


}

final authController = Get.put(AuthController());
