import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/auth/ui/registration/otp/otp_screen.dart';
import 'features/auth/ui/registration/registration_screen.dart';
import 'features/family_head_form/head_form_controller.dart';
import 'features/family_head_form/head_form_navigator_screen.dart';
import 'firebase_options.dart';
import 'app_theme.dart';
import 'features/auth/ui/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const LoginScreen()),
        GetPage(name: '/registration', page: () => const RegistrationScreen()),
        GetPage(name: '/otp', page: () => const OTPScreen()),
        GetPage(
          name: '/family-head-form',
          page: () => HeadFormNavigatorScreen(),
          binding: BindingsBuilder(() {
            Get.put(HeadFormController());
          }),
        ),

      ],
      debugShowCheckedModeBanner: false,
      title: 'SuperStore',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const LoginScreen(),
    );
  }
}
