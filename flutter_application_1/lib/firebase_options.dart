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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDUDYyMnL0WY0Cmj9PfGqYiYcVDu4n7j0g',
    appId: '1:910848159267:web:1eb8c6c04827117d264b96',
    messagingSenderId: '910848159267',
    projectId: 'my-project-20e8a',
    authDomain: 'my-project-20e8a.firebaseapp.com',
    storageBucket: 'my-project-20e8a.appspot.com',
    measurementId: 'G-GCWE9MYRD2',
  );

  // Web Configuration

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTlelmAVIbSfm4wnIK5jxOgHF-QuwvMYw',
    appId: '1:910848159267:android:361fa713121435f2264b96',
    messagingSenderId: '910848159267',
    projectId: 'my-project-20e8a',
    storageBucket: 'my-project-20e8a.appspot.com',
  );

  // Android Configuration

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCsSrq2K_A4VK7PSreRlnTwhIVUBqVxy4',
    appId: '1:910848159267:ios:d3283e9a9a8ac6d9264b96',
    messagingSenderId: '910848159267',
    projectId: 'my-project-20e8a',
    storageBucket: 'my-project-20e8a.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  // iOS Configuration

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDCsSrq2K_A4VK7PSreRlnTwhIVUBqVxy4',
    appId: '1:910848159267:ios:d3283e9a9a8ac6d9264b96',
    messagingSenderId: '910848159267',
    projectId: 'my-project-20e8a',
    storageBucket: 'my-project-20e8a.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  // macOS Configuration

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDUDYyMnL0WY0Cmj9PfGqYiYcVDu4n7j0g',
    appId: '1:910848159267:web:b8e04b7d7dcc3c1b264b96',
    messagingSenderId: '910848159267',
    projectId: 'my-project-20e8a',
    authDomain: 'my-project-20e8a.firebaseapp.com',
    storageBucket: 'my-project-20e8a.appspot.com',
    measurementId: 'G-XF3REH1YXD',
  );

  // Windows Configuration
}