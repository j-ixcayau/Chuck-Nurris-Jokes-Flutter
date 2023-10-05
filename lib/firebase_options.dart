import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

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
    apiKey: 'AIzaSyCHfpHnIui4IGkEuN1cIT6IleiEr2xsVVo',
    appId: '1:77388352372:web:042cf9d7eebd1427d6ba21',
    messagingSenderId: '77388352372',
    projectId: 'chuck-norris-jokes-d32a8',
    authDomain: 'chuck-norris-jokes-d32a8.firebaseapp.com',
    storageBucket: 'chuck-norris-jokes-d32a8.appspot.com',
    measurementId: 'G-S856Q8EFJQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAed37kO5JiHBB3tEJqR8X-lb9m-w1NlU',
    appId: '1:77388352372:android:c1d400cd21ab70ded6ba21',
    messagingSenderId: '77388352372',
    projectId: 'chuck-norris-jokes-d32a8',
    storageBucket: 'chuck-norris-jokes-d32a8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDKsZcbxwYslzqpwapZaeIpNWR8614d6No',
    appId: '1:77388352372:ios:b41db82ce5e53c06d6ba21',
    messagingSenderId: '77388352372',
    projectId: 'chuck-norris-jokes-d32a8',
    storageBucket: 'chuck-norris-jokes-d32a8.appspot.com',
    iosBundleId: 'com.jixcayau.chuckNorrisJokes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDKsZcbxwYslzqpwapZaeIpNWR8614d6No',
    appId: '1:77388352372:ios:1238ed92cd2dd8ffd6ba21',
    messagingSenderId: '77388352372',
    projectId: 'chuck-norris-jokes-d32a8',
    storageBucket: 'chuck-norris-jokes-d32a8.appspot.com',
    iosBundleId: 'com.jixcayau.chuckNurrisJokesFlutter',
  );
}
