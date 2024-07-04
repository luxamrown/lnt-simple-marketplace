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
    apiKey: 'AIzaSyASkc4uaO5URwTo7xPVG1wpt__Ad7jIHLw',
    appId: '1:819047506407:web:0c704dd39174bcbabb9d42',
    messagingSenderId: '819047506407',
    projectId: 'lnt-simple-marketplace-3fdb7',
    authDomain: 'lnt-simple-marketplace-3fdb7.firebaseapp.com',
    storageBucket: 'lnt-simple-marketplace-3fdb7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3q2eMYFXrFNNgN8HQlHL3Je2EktvIxBg',
    appId: '1:819047506407:android:9255b19582820f5fbb9d42',
    messagingSenderId: '819047506407',
    projectId: 'lnt-simple-marketplace-3fdb7',
    storageBucket: 'lnt-simple-marketplace-3fdb7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCG3orUlQouGzazshGNYYglkY5Sk1hJyls',
    appId: '1:819047506407:ios:20838ab4621b2b8bbb9d42',
    messagingSenderId: '819047506407',
    projectId: 'lnt-simple-marketplace-3fdb7',
    storageBucket: 'lnt-simple-marketplace-3fdb7.appspot.com',
    iosBundleId: 'com.example.lntSimpleMarketplace',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCG3orUlQouGzazshGNYYglkY5Sk1hJyls',
    appId: '1:819047506407:ios:20838ab4621b2b8bbb9d42',
    messagingSenderId: '819047506407',
    projectId: 'lnt-simple-marketplace-3fdb7',
    storageBucket: 'lnt-simple-marketplace-3fdb7.appspot.com',
    iosBundleId: 'com.example.lntSimpleMarketplace',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyASkc4uaO5URwTo7xPVG1wpt__Ad7jIHLw',
    appId: '1:819047506407:web:ee3ffddd9c66350bbb9d42',
    messagingSenderId: '819047506407',
    projectId: 'lnt-simple-marketplace-3fdb7',
    authDomain: 'lnt-simple-marketplace-3fdb7.firebaseapp.com',
    storageBucket: 'lnt-simple-marketplace-3fdb7.appspot.com',
  );
}