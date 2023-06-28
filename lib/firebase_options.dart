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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQ3N7eztIHkDX0tlaHYisyoG3WSQvhPu0',
    appId: '1:957355946996:android:0c2b31fd03071f10b7bfa1',
    messagingSenderId: '957355946996',
    projectId: 'jinjicouple-dd6f2',
    storageBucket: 'jinjicouple-dd6f2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-mJenNHp5wzTe6HW_EWDgE6kkwu0C9hk',
    appId: '1:957355946996:ios:342bfd5dd7b6012cb7bfa1',
    messagingSenderId: '957355946996',
    projectId: 'jinjicouple-dd6f2',
    storageBucket: 'jinjicouple-dd6f2.appspot.com',
    iosClientId: '957355946996-e9eb6aj7eog3gh09uiusa1j8hhsmpju9.apps.googleusercontent.com',
    iosBundleId: 'com.jinjicouple.day2000.jinjicouple',
  );
}