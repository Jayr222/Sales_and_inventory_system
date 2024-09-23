import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // Web Configuration
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCTlelmAVIbSfm4wnIK5jxOgHF-QuwvMYw', // Your web API key
    appId: 'com.example.flutter_app', // Replace with your web app ID
    messagingSenderId: '769516460679',
    projectId: 'my-project-20e8a',
    authDomain: 'my-project-20e8a.firebaseapp.com', // Correct web authDomain
    storageBucket: 'salesandinventorysystem-105e8.appspot.com',
    measurementId: '', // Optional, only if you're using Google Analytics
  );

  // Android Configuration
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTlelmAVIbSfm4wnIK5jxOgHF-QuwvMYw',
    appId: 'com.example.flutter_app', // Your Android app ID
    messagingSenderId: '769516460679',
    projectId: 'my-project-20e8a',
    storageBucket: 'salesandinventorysystem-105e8.appspot.com',
  );

  // iOS Configuration
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTlelmAVIbSfm4wnIK5jxOgHF-QuwvMYw',
    appId: '1:769516460679:ios:appID-for-ios', // Your iOS app ID
    messagingSenderId: '769516460679',
    projectId: 'my-project-20e8a',
    storageBucket: 'salesandinventorysystem-105e8.appspot.com',
    iosBundleId: 'com.example.flutter_app', // Replace with your iOS bundle ID
  );

  // macOS Configuration
  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCTlelmAVIbSfm4wnIK5jxOgHF-QuwvMYw',
    appId: '1:769516460679:macos:appID-for-macos', // Your macOS app ID
    messagingSenderId: '769516460679',
    projectId: 'my-project-20e8a',
    storageBucket: 'salesandinventorysystem-105e8.appspot.com',
    iosBundleId: 'com.example.flutter_app', // Same as iOS bundle ID
  );

  // Windows Configuration
  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCTlelmAVIbSfm4wnIK5jxOgHF-QuwvMYw',
    appId: '1:769516460679:windows:appID-for-windows', // Your Windows app ID
    messagingSenderId: '769516460679',
    projectId: 'my-project-20e8a',
    authDomain: 'my-project-20e8a.firebaseapp.com',
    storageBucket: 'salesandinventorysystem-105e8.appspot.com',
    measurementId: 'G-YOUR_MEASUREMENT_ID', // Can be removed if not used
  );
}
