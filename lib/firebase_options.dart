// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyASO2EmSat4QkVn9qZe9Gq5VQWYIx-EWhs',
    appId: '1:606427333960:web:1f30480120dbd2b5a01f7d',
    messagingSenderId: '606427333960',
    projectId: 'flutter-csgo-grenades-app',
    authDomain: 'flutter-csgo-grenades-app.firebaseapp.com',
    storageBucket: 'flutter-csgo-grenades-app.appspot.com',
    measurementId: 'G-T8JKL13EH7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7EXw24XLIdUvjfr4D6a4QDz77SmphUHU',
    appId: '1:606427333960:android:1ca54aaa017f2e48a01f7d',
    messagingSenderId: '606427333960',
    projectId: 'flutter-csgo-grenades-app',
    storageBucket: 'flutter-csgo-grenades-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBle0NZeP4N0uDRPQDfQHZDsG2Hj-OIL3E',
    appId: '1:606427333960:ios:fc72444e2eac7057a01f7d',
    messagingSenderId: '606427333960',
    projectId: 'flutter-csgo-grenades-app',
    storageBucket: 'flutter-csgo-grenades-app.appspot.com',
    iosClientId: '606427333960-l5sl6lavsu293khssmsrdsrsobiool3o.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterCsgoGrenadesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBle0NZeP4N0uDRPQDfQHZDsG2Hj-OIL3E',
    appId: '1:606427333960:ios:fc72444e2eac7057a01f7d',
    messagingSenderId: '606427333960',
    projectId: 'flutter-csgo-grenades-app',
    storageBucket: 'flutter-csgo-grenades-app.appspot.com',
    iosClientId: '606427333960-l5sl6lavsu293khssmsrdsrsobiool3o.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterCsgoGrenadesApp',
  );
}