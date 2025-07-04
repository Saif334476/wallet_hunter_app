// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLYZcAfnBqi2nF8x6mHLeItRXFF41uPe8',
    appId: '1:454010895762:android:9ea0800de5dff1f74ad54b',
    messagingSenderId: '454010895762',
    projectId: 'wallet-hunter-app',
    storageBucket: 'wallet-hunter-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPZCA3FAwGpwWEkwrGdOY7Oxsf6PRNeyg',
    appId: '1:454010895762:ios:53f19bbbee5113514ad54b',
    messagingSenderId: '454010895762',
    projectId: 'wallet-hunter-app',
    storageBucket: 'wallet-hunter-app.firebasestorage.app',
    iosBundleId: 'com.example.walletHunterApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCrtAOWvZAHea_vdQSQwFA28sf4cksgLH0',
    appId: '1:454010895762:web:82f884110f56b3304ad54b',
    messagingSenderId: '454010895762',
    projectId: 'wallet-hunter-app',
    authDomain: 'wallet-hunter-app.firebaseapp.com',
    storageBucket: 'wallet-hunter-app.firebasestorage.app',
    measurementId: 'G-EH9BPBN47M',
  );
}
