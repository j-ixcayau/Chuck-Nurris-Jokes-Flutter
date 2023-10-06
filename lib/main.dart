import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:chuck_norris_jokes/app.dart';
import 'package:chuck_norris_jokes/firebase_options.dart';
import 'package:chuck_norris_jokes/presentation/utils/constants/app_locale.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  MobileAds.instance.initialize();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    EasyLocalization(
      supportedLocales: AppLocale.locales,
      path: 'assets/translations',
      fallbackLocale: AppLocale.englishLocale,
      child: const MyApp(),
    ),
  );
}
