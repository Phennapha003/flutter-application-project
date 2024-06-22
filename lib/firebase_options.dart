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
    apiKey: 'AIzaSyAkkUuc1qY2FR7TNK5S15SAIjpuRSyJBt8',
    appId: '1:1000245470261:web:87a2644597f697b5413d7c',
    messagingSenderId: '1000245470261',
    projectId: 'project-1550e',
    authDomain: 'project-1550e.firebaseapp.com',
    storageBucket: 'project-1550e.appspot.com',
    measurementId: 'G-VMK4BHNEHC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2seO0ZwcOhXfGTR0pbWS2s9qWuariVSg',
    appId: '1:1000245470261:android:1916bec01df6a43b413d7c',
    messagingSenderId: '1000245470261',
    projectId: 'project-1550e',
    storageBucket: 'project-1550e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlLaVwFJbmKkoDHOkBkgHXmx9KCHuQ798',
    appId: '1:1000245470261:ios:cc2e4c46ea46d70a413d7c',
    messagingSenderId: '1000245470261',
    projectId: 'project-1550e',
    storageBucket: 'project-1550e.appspot.com',
    iosBundleId: 'com.example.flutterApplicationProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBlLaVwFJbmKkoDHOkBkgHXmx9KCHuQ798',
    appId: '1:1000245470261:ios:3014fdcc1d93283d413d7c',
    messagingSenderId: '1000245470261',
    projectId: 'project-1550e',
    storageBucket: 'project-1550e.appspot.com',
    iosBundleId: 'com.example.flutterApplicationProject.RunnerTests',
  );
}
