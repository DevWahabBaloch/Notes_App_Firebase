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
    apiKey: 'AIzaSyBLkbgeiBjwI6YwdVUVj7yE150ozvDs3W8',
    appId: '1:750818425272:web:130cd69bf4c52f68d5b74d',
    messagingSenderId: '750818425272',
    projectId: 'my-notes-crud',
    authDomain: 'my-notes-crud.firebaseapp.com',
    storageBucket: 'my-notes-crud.appspot.com',
    measurementId: 'G-4L5F8CKRVV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0SK0lniAQcGEqQw-6DWtC_Jw1AWjWMFU',
    appId: '1:750818425272:android:93696bf68cd26a63d5b74d',
    messagingSenderId: '750818425272',
    projectId: 'my-notes-crud',
    storageBucket: 'my-notes-crud.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZOL3raDQFmCyfx7gVmfvkxHm26J_r1EM',
    appId: '1:750818425272:ios:27ce2a875298329ed5b74d',
    messagingSenderId: '750818425272',
    projectId: 'my-notes-crud',
    storageBucket: 'my-notes-crud.appspot.com',
    iosBundleId: 'com.example.notesAppUsingFirebaseCrud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBZOL3raDQFmCyfx7gVmfvkxHm26J_r1EM',
    appId: '1:750818425272:ios:27ce2a875298329ed5b74d',
    messagingSenderId: '750818425272',
    projectId: 'my-notes-crud',
    storageBucket: 'my-notes-crud.appspot.com',
    iosBundleId: 'com.example.notesAppUsingFirebaseCrud',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBLkbgeiBjwI6YwdVUVj7yE150ozvDs3W8',
    appId: '1:750818425272:web:88ed153224e5ef6ad5b74d',
    messagingSenderId: '750818425272',
    projectId: 'my-notes-crud',
    authDomain: 'my-notes-crud.firebaseapp.com',
    storageBucket: 'my-notes-crud.appspot.com',
    measurementId: 'G-VN16ETS75P',
  );
}
