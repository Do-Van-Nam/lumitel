import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';
RxString currentLanguage = 'en'.obs;

void changeLanguage(String languageCode) {
  currentLanguage.value = languageCode;
  Get.updateLocale(Locale(languageCode));
}
class LanguageDropdown extends StatefulWidget {
  @override
  _LanguageDropdownState createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  final Map<String, String> languages = {
    'English': 'en',
    'French': 'fr',
    'Kirundi': 'ki',
  };

  final Map<String, String> flagUrls = {
    'English':
        'https://flagcdn.com/w40/gb.png',
    'French':
        'https://flagcdn.com/w40/fr.png',
    'Kirundi':
        'https://flagcdn.com/w40/bi.png',
  };

  late String selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = languages.entries
            .firstWhere((entry) => entry.value == currentLanguage.value,
                orElse: () => MapEntry('English', 'en'))
            .key;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0x66084268),
            offset: Offset(0, 4),
            blurRadius: 20,
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedLanguage,
          icon: Icon(Icons.arrow_drop_down, color: Colors.white),
          dropdownColor: AppColors.primary,
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                selectedLanguage = newValue;
              });
              final code = languages[newValue]!;
              changeLanguage(code);
            }
          },
          items: languages.keys.map((language) {
            return DropdownMenuItem<String>(
              value: language,
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: flagUrls[language]!,
                    width: 24,
                    height: 24,
                    placeholder: (context, url) => SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  SizedBox(width: 8),
                  Text(
                    language,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
