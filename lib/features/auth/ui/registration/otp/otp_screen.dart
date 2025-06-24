import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../controller/registration_controller.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late String phoneNumber;
  late String verificationId;
  late bool isRegistration;

  final TextEditingController otpController = TextEditingController();
  Timer? _timer;
  int _remainingSeconds = 60;

  @override
  void initState() {
    super.initState();
    final args = Get.arguments as Map<String, dynamic>;
    phoneNumber = args['phoneNumber'];
    verificationId = args['verificationId'];
    isRegistration = args['isRegistration'];

    startTimer();
  }

  void startTimer() {
    _remainingSeconds = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            padding: const EdgeInsets.all(32),
            constraints: const BoxConstraints(maxWidth: 500),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                if (!isDark)
                  const BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    offset: Offset(0, 8),
                  ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/app_logo.png", height: 80),
                const SizedBox(height: 16),
                Text(
                  "Enter the OTP",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "We’ve sent a 6-digit code to $phoneNumber",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onBackground.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 32),

                // OTP Input
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  controller: otpController,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 55,
                    fieldWidth: 45,
                    inactiveColor: colorScheme.outline,
                    activeColor: colorScheme.primary,
                    selectedColor: colorScheme.primary.withOpacity(0.8),
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  onChanged: (value) {},
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      registrationController.verifyOtp(
                        otpController.text.trim(),
                        isRegistration,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ).copyWith(
                      backgroundColor:
                      MaterialStatePropertyAll(colorScheme.primary),
                      foregroundColor:
                      MaterialStatePropertyAll(colorScheme.onPrimary),
                    ),
                    child: Text(
                      "Verify & Continue",
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                _remainingSeconds > 0
                    ? Text(
                  "Resend code in 00:${_remainingSeconds.toString().padLeft(2, '0')}",
                  style: theme.textTheme.bodySmall,
                )
                    : TextButton(
                  onPressed: () {
                    registrationController.sendOtp(
                      isRegistration: isRegistration,
                    );
                    startTimer(); // restart timer
                  },
                  child: const Text("Resend OTP"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
