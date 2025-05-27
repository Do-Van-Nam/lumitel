import 'package:get/get.dart';
import 'package:flutter_app/translations/en_us.dart';
import 'package:flutter_app/translations/fr_fr.dart';
import 'package:flutter_app/translations/ki_ru.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': enUS,
    'fr': frFR,
    'ki': kiRu,
  };
}
