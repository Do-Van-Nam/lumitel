import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/screens/landing_screen.dart';
import 'package:get/get.dart';

import 'package:logger/logger.dart';

import 'translations/app_translations.dart';

final logger = Logger();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String initialLocale =  'en';
    return GetMaterialApp(
      title: 'Lumitel',
      debugShowCheckedModeBanner: false,
      locale: Locale(initialLocale),
      fallbackLocale: Locale('en'),
      translations: AppTranslations(),
      home: LandingScreen(),
    );
  }
}
