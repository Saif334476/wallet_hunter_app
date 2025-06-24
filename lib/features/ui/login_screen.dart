import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 700;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            constraints: BoxConstraints(maxWidth: isDesktop ? 500 : double.infinity),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                if (theme.brightness == Brightness.light)
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
                // App logo
                Image.asset(
                  "assets/app_logo.png",
                  height: 80,
                  width: 80,
                ),
                const SizedBox(height: 16),
                Text(
                  "Welcome to Wallet Hunter",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Login using your phone number",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onBackground.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 32),


                Obx(() => CustomTextField(
                  label: "Phone Number",
                  isPassword: false,
                  onChanged: authController.updatePhoneNumber,
                  errorText: authController.phoneError.value,
                )),

                const SizedBox(height: 24),


                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ).copyWith(
                      backgroundColor: MaterialStatePropertyAll(colorScheme.primary),
                      foregroundColor: MaterialStatePropertyAll(colorScheme.onPrimary),
                    ),
                    child: Text(
                      "Send OTP",
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Text(
                  "You'll receive a code via SMS",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),

                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                  },
                  child: const Text("Don't have an account? Register here"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
