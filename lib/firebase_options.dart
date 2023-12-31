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
    apiKey: 'AIzaSyA_3E0oIeNQdkDtBiuM-Edx-m-J2A8JxaQ',
    appId: '1:76948946420:web:3c5b47c700046614a28da1',
    messagingSenderId: '76948946420',
    projectId: 'bdagendamento-3a12f',
    authDomain: 'bdagendamento-3a12f.firebaseapp.com',
    storageBucket: 'bdagendamento-3a12f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAtmllfH5sXRElgc8NuxPG3nHb7tmc1S34',
    appId: '1:76948946420:android:e811094c4bfcc359a28da1',
    messagingSenderId: '76948946420',
    projectId: 'bdagendamento-3a12f',
    storageBucket: 'bdagendamento-3a12f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD6SUfr3dX6z5Gc5r4CtYH_Ju5jjbpSStI',
    appId: '1:76948946420:ios:73e96c4ff83a184da28da1',
    messagingSenderId: '76948946420',
    projectId: 'bdagendamento-3a12f',
    storageBucket: 'bdagendamento-3a12f.appspot.com',
    iosClientId: '76948946420-7kqsvsr0sditro0edaf2svum7f7vf6e3.apps.googleusercontent.com',
    iosBundleId: 'com.example.agendamento',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD6SUfr3dX6z5Gc5r4CtYH_Ju5jjbpSStI',
    appId: '1:76948946420:ios:73e96c4ff83a184da28da1',
    messagingSenderId: '76948946420',
    projectId: 'bdagendamento-3a12f',
    storageBucket: 'bdagendamento-3a12f.appspot.com',
    iosClientId: '76948946420-7kqsvsr0sditro0edaf2svum7f7vf6e3.apps.googleusercontent.com',
    iosBundleId: 'com.example.agendamento',
  );
}
