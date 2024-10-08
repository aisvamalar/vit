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
    apiKey: 'AIzaSyBsr9rfTVTeVy7rymNyk6GxIGsxZa6QsWM',
    appId: '1:88444820251:web:fb8be6ca975bdccd4511be',
    messagingSenderId: '88444820251',
    projectId: 'speaksi-6f952',
    authDomain: 'speaksi-6f952.firebaseapp.com',
    storageBucket: 'speaksi-6f952.appspot.com',
    measurementId: 'G-FB0PPR75WQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDbYU8HAVuaVu6IoRCUz-w-xeaw1QWGTuY',
    appId: '1:88444820251:android:03cad42609a349bd4511be',
    messagingSenderId: '88444820251',
    projectId: 'speaksi-6f952',
    storageBucket: 'speaksi-6f952.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCzT1WrjeK-6Wrk6AJY-bi1QVg-22JsTZM',
    appId: '1:88444820251:ios:ee7f5866ffe0538f4511be',
    messagingSenderId: '88444820251',
    projectId: 'speaksi-6f952',
    storageBucket: 'speaksi-6f952.appspot.com',
    iosBundleId: 'com.example.speaksi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCzT1WrjeK-6Wrk6AJY-bi1QVg-22JsTZM',
    appId: '1:88444820251:ios:ee7f5866ffe0538f4511be',
    messagingSenderId: '88444820251',
    projectId: 'speaksi-6f952',
    storageBucket: 'speaksi-6f952.appspot.com',
    iosBundleId: 'com.example.speaksi',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBsr9rfTVTeVy7rymNyk6GxIGsxZa6QsWM',
    appId: '1:88444820251:web:ca45acb5d2c842e14511be',
    messagingSenderId: '88444820251',
    projectId: 'speaksi-6f952',
    authDomain: 'speaksi-6f952.firebaseapp.com',
    storageBucket: 'speaksi-6f952.appspot.com',
    measurementId: 'G-9MGQNQ98K6',
  );
}
