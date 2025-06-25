import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'otp_controller.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});

  final OTPController otpController = Get.find<OTPController>();
  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final phone = args['phoneNumber'] ?? '';
    final verificationId = args['verificationId'] ?? '';
    final isRegistration = args['isRegistration'] ?? false;


    if (otpController.phoneNumber.value != phone) {
      otpController.setData(phone: phone, vId: verificationId);
    }

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
                  "We’ve sent a 6-digit code to $phone",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onBackground.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 32),

                // ✅ No need for Obx here
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  controller: pinController,
                  onChanged: (value) => otpController.otpCode.value = value,
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
                ),

                const SizedBox(height: 24),

                // ✅ isVerifying
                Obx(() => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: otpController.isVerifying.value
                        ? null
                        : () => otpController.verifyOTP(),
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
                    child: otpController.isVerifying.value
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : Text(
                      "Verify & Continue",
                      style:
                      theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )),

                const SizedBox(height: 20),


                Obx(() => otpController.secondsRemaining.value > 0
                    ? Text(
                  "Resend code in 00:${otpController.secondsRemaining.value.toString().padLeft(2, '0')}",
                  style: theme.textTheme.bodySmall,
                )
                    : TextButton(
                  onPressed: () {
                    otpController.resendOTP();
                  },
                  child: const Text("Resend OTP"),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
