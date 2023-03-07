// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:flutter_dotenv/flutter_dotenv.dart';
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

  static final FirebaseOptions web = FirebaseOptions(
    apiKey: dotenv.env['FLUTTER_WEB_API_KEY'] ?? '',
    appId: dotenv.env['FLUTTER_WEB_APP_ID'] ?? '',
    messagingSenderId: dotenv.env['FLUTTER_WEB_MESSEGING_SENDER_ID'] ?? '',
    projectId: dotenv.env['FLUTTER_WEB_PROJECT_ID'] ?? '',
    authDomain: dotenv.env['FLUTTER_WEB_AUTH_DOMAIN'] ?? '',
    storageBucket: dotenv.env['FLUTTER_WEB_STORAGE_BUCKET'] ?? '',
  );

  static final FirebaseOptions android = FirebaseOptions(
    apiKey: dotenv.env['FLUTTER_ANDROID_API_KEY'] ?? '',
    appId: dotenv.env['FLUTTER_ANDROID_APP_ID'] ?? '',
    messagingSenderId: dotenv.env['FLUTTER_ANDROID_MESSAGING_SENDER_ID'] ?? '',
    projectId: dotenv.env['FLUTTER_ANDROID_PROJECT_ID'] ?? '',
    storageBucket: dotenv.env['FLUTTER_ANDROID_STORAGE_BUCKET'] ?? '',
  );

  static final FirebaseOptions ios = FirebaseOptions(
    apiKey: dotenv.env['FLUTTER_IOS_API_KEY'] ?? '',
    appId: dotenv.env['FLUTTER_IOS_APP_ID'] ?? '',
    messagingSenderId: dotenv.env['FLUTTER_IOS_MESSAGING_SENDER_ID'] ?? '',
    projectId: dotenv.env['FLUTTER_IOS_PROJECT_ID'] ?? '',
    storageBucket: dotenv.env['FLUTTER_IOS_STORAGE_BUCKET'] ?? '',
    iosClientId: dotenv.env['FLUTTER_IOS_CLIEND_ID'] ?? '',
    iosBundleId: dotenv.env['FLUTTER_IOS_BUNDLE_ID'] ?? '',
  );

  static final FirebaseOptions macos = FirebaseOptions(
    apiKey: dotenv.env['FLUTTER_MACOS_API_KEY'] ?? '',
    appId: dotenv.env['FLUTTER_MACOS_APP_ID'] ?? '',
    messagingSenderId: dotenv.env['FLUTTER_MACOS_MESSAGING_SENDER_ID'] ?? '',
    projectId: dotenv.env['FLUTTER_MACOS_PROJECT_ID'] ?? '',
    storageBucket: dotenv.env['FLUTTER_MACOS_STORAGE_BUCKET'] ?? '',
    iosClientId: dotenv.env['FLUTTER_MACOS_CLIEND_ID'] ?? '',
    iosBundleId: dotenv.env['FLUTTER_MACOS_BUNDLE_ID'] ?? '',
  );
}
