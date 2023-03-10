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
    apiKey: 'AIzaSyCneF1vU-BcUQvfdXT9yRbJxSgnfwuPYHk',
    appId: '1:58813126779:web:ae88eb426d8fff76c52ade',
    messagingSenderId: '58813126779',
    projectId: 'task-mng-app',
    authDomain: 'task-mng-app.firebaseapp.com',
    storageBucket: 'task-mng-app.appspot.com',
    measurementId: 'G-CPPC4GZJ7Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRXueFKCw5fScdSLMX4Cj7tL7z7iJi_kI',
    appId: '1:58813126779:android:39d6598643a7d228c52ade',
    messagingSenderId: '58813126779',
    projectId: 'task-mng-app',
    storageBucket: 'task-mng-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQP7BLQUAEJc213wDKHEA3poc0TrzXVPU',
    appId: '1:58813126779:ios:8ac0643d585bb888c52ade',
    messagingSenderId: '58813126779',
    projectId: 'task-mng-app',
    storageBucket: 'task-mng-app.appspot.com',
    iosClientId: '58813126779-a7jm5flt0smrvuok7r8kfeija4tsbs7n.apps.googleusercontent.com',
    iosBundleId: 'com.example.taskManagementApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCQP7BLQUAEJc213wDKHEA3poc0TrzXVPU',
    appId: '1:58813126779:ios:8ac0643d585bb888c52ade',
    messagingSenderId: '58813126779',
    projectId: 'task-mng-app',
    storageBucket: 'task-mng-app.appspot.com',
    iosClientId: '58813126779-a7jm5flt0smrvuok7r8kfeija4tsbs7n.apps.googleusercontent.com',
    iosBundleId: 'com.example.taskManagementApp',
  );
}
