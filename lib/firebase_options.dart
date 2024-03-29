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
    apiKey: 'AIzaSyCwjmrsHTMMKkPgqbzh66vlYvwjmBIvfhQ',
    appId: '1:229385586199:web:bc15de2bd2aca48cadbe52',
    messagingSenderId: '229385586199',
    projectId: 'automanager-b0c67',
    authDomain: 'automanager-b0c67.firebaseapp.com',
    storageBucket: 'automanager-b0c67.appspot.com',
    measurementId: 'G-KMKCGQ14B2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhRxjjUI22MajxR7sA9aBpOLHWLZoNBqc',
    appId: '1:229385586199:android:686c7b4809719741adbe52',
    messagingSenderId: '229385586199',
    projectId: 'automanager-b0c67',
    storageBucket: 'automanager-b0c67.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0UareRF_5clf-fh6TaD7zk51ucuHZHiI',
    appId: '1:229385586199:ios:56e4fee8ec50f98badbe52',
    messagingSenderId: '229385586199',
    projectId: 'automanager-b0c67',
    storageBucket: 'automanager-b0c67.appspot.com',
    iosBundleId: 'com.example.autoManagerList',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB0UareRF_5clf-fh6TaD7zk51ucuHZHiI',
    appId: '1:229385586199:ios:4affb4abf388bca9adbe52',
    messagingSenderId: '229385586199',
    projectId: 'automanager-b0c67',
    storageBucket: 'automanager-b0c67.appspot.com',
    iosBundleId: 'com.example.autoManagerList.RunnerTests',
  );
}
