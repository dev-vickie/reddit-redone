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
    apiKey: 'AIzaSyCpjvJh8yRKFxCYX7C1uRStLhkNOJOjyNA',
    appId: '1:174272372717:web:8fad06723c6cae705811e4',
    messagingSenderId: '174272372717',
    projectId: 'reddit-184a2',
    authDomain: 'reddit-184a2.firebaseapp.com',
    storageBucket: 'reddit-184a2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOJ0KBBeTft4eq2MgePmBP69YQSiISTzU',
    appId: '1:174272372717:android:cbc01b38fe738cfd5811e4',
    messagingSenderId: '174272372717',
    projectId: 'reddit-184a2',
    storageBucket: 'reddit-184a2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAXfi3RWqJtLNIu7D4Kmmo5wGlNL9PdwME',
    appId: '1:174272372717:ios:9bb17c24eb296b005811e4',
    messagingSenderId: '174272372717',
    projectId: 'reddit-184a2',
    storageBucket: 'reddit-184a2.appspot.com',
    iosClientId: '174272372717-hlumj1b89du778i2d0oa5qa1n83hi1c4.apps.googleusercontent.com',
    iosBundleId: 'com.vickie.reddit',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAXfi3RWqJtLNIu7D4Kmmo5wGlNL9PdwME',
    appId: '1:174272372717:ios:9bb17c24eb296b005811e4',
    messagingSenderId: '174272372717',
    projectId: 'reddit-184a2',
    storageBucket: 'reddit-184a2.appspot.com',
    iosClientId: '174272372717-hlumj1b89du778i2d0oa5qa1n83hi1c4.apps.googleusercontent.com',
    iosBundleId: 'com.vickie.reddit',
  );
}
