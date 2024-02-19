// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members, depend_on_referenced_packages
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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA-SKbuICthtB2K_mu7oLtasdcKUVgH9T0',
    appId: '1:678087052445:web:48951f9359fb2c0fc2d874',
    messagingSenderId: '678087052445',
    projectId: 'flutterfirebase-86ea8',
    authDomain: 'flutterfirebase-86ea8.firebaseapp.com',
    databaseURL: 'https://flutterfirebase-86ea8-default-rtdb.firebaseio.com',
    storageBucket: 'flutterfirebase-86ea8.appspot.com',
    measurementId: 'G-4NRCSKE983',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAF5SvQYL02-d7ZBaBvvhdjnNDlCOBRPUU',
    appId: '1:678087052445:android:44e45323886f5759c2d874',
    messagingSenderId: '678087052445',
    projectId: 'flutterfirebase-86ea8',
    databaseURL: 'https://flutterfirebase-86ea8-default-rtdb.firebaseio.com',
    storageBucket: 'flutterfirebase-86ea8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDMPua3J8sCkVIAlVfDGnpLLpTxY_a3qF8',
    appId: '1:678087052445:ios:df3418eb52a4ea49c2d874',
    messagingSenderId: '678087052445',
    projectId: 'flutterfirebase-86ea8',
    databaseURL: 'https://flutterfirebase-86ea8-default-rtdb.firebaseio.com',
    storageBucket: 'flutterfirebase-86ea8.appspot.com',
    iosBundleId: 'com.example.crudeapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDMPua3J8sCkVIAlVfDGnpLLpTxY_a3qF8',
    appId: '1:678087052445:ios:8466754faef4dd69c2d874',
    messagingSenderId: '678087052445',
    projectId: 'flutterfirebase-86ea8',
    databaseURL: 'https://flutterfirebase-86ea8-default-rtdb.firebaseio.com',
    storageBucket: 'flutterfirebase-86ea8.appspot.com',
    iosBundleId: 'com.example.crudeapp.RunnerTests',
  );
}
