import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../ui/registration/otp/otp_controller.dart';


class RegistrationController extends GetxController {
  final phoneNumber = ''.obs;
  final otpCode = ''.obs;
  final phoneError = ''.obs;

  late String _verificationId;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updatePhoneNumber(String value) => phoneNumber.value = value;
  void updateOtpCode(String value) => otpCode.value = value;

  void sendOtp({bool isRegistration = false}) async {
    phoneError.value = '';

    if (phoneNumber.value.trim().isEmpty) {
      phoneError.value = 'Phone number cannot be empty';
      return;
    }

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber.value.trim(),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        if (isRegistration) {
          Get.toNamed('/family-head-form');
        } else {
          Get.snackbar('Success', 'Logged in automatically');
        }
      },
      timeout: const Duration(seconds: 60),
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar('Verification Failed', e.message ?? 'Unknown error');
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;

        /// ✅ Set values in OTP controller
        final otpController = Get.put(OTPController());
        otpController.setData(
          phone: phoneNumber.value.trim(),
          vId: verificationId,
        );

        Get.toNamed('/otp', arguments: {
          'phoneNumber': phoneNumber.value.trim(),
          'verificationId': verificationId,
          'isRegistration': isRegistration,
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  void verifyOtp(String otp, bool isRegistration) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      );
      await _auth.signInWithCredential(credential);

      if (isRegistration) {
        Get.toNamed('/family-head-form');
      } else {
        Get.snackbar('Success', 'Logged in successfully');
      }
    } catch (e) {
      Get.snackbar('OTP Failed', e.toString());
    }
  }
}

final registrationController = Get.put(RegistrationController());
