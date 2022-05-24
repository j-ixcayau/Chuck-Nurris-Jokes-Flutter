import 'package:flutter/material.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PCacheImage.init();

  runApp(const MyApp());
}
