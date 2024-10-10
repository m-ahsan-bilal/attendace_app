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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCDHaNrKRrXrZSQiucKvfvoeLbn38xxN5A',
    appId: '1:724904982966:web:28a15e3b5c4bf068332917',
    messagingSenderId: '724904982966',
    projectId: 'attendance-app-task',
    authDomain: 'attendance-app-task.firebaseapp.com',
    storageBucket: 'attendance-app-task.appspot.com',
    measurementId: 'G-83SWRSQHH3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJ8yvQ7ZDydLAYriqOCiemS_VdaouDTNI',
    appId: '1:724904982966:android:4e5bf6ea87e7f89d332917',
    messagingSenderId: '724904982966',
    projectId: 'attendance-app-task',
    storageBucket: 'attendance-app-task.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTESxN7SSWDGlxIdtVGK1O-eMH3x1YGKU',
    appId: '1:724904982966:ios:2c5376740234ca99332917',
    messagingSenderId: '724904982966',
    projectId: 'attendance-app-task',
    storageBucket: 'attendance-app-task.appspot.com',
    iosBundleId: 'com.example.attendaceTaskApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDTESxN7SSWDGlxIdtVGK1O-eMH3x1YGKU',
    appId: '1:724904982966:ios:2c5376740234ca99332917',
    messagingSenderId: '724904982966',
    projectId: 'attendance-app-task',
    storageBucket: 'attendance-app-task.appspot.com',
    iosBundleId: 'com.example.attendaceTaskApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCDHaNrKRrXrZSQiucKvfvoeLbn38xxN5A',
    appId: '1:724904982966:web:359509002859ecb3332917',
    messagingSenderId: '724904982966',
    projectId: 'attendance-app-task',
    authDomain: 'attendance-app-task.firebaseapp.com',
    storageBucket: 'attendance-app-task.appspot.com',
    measurementId: 'G-HYMVZEJ4WF',
  );
}
