import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';

class LanguageDropdown extends StatefulWidget {
  @override
  _LanguageDropdownState createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String selectedLanguage = 'English';

  final Map<String, String> languages = {
    'English':
        'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/e09fe0d3aa10d8d28ffa3f14e436abfb95723099?placeholderIfAbsent=true',
    'French':
        'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/e09fe0d3aa10d8d28ffa3f14e436abfb95723099?placeholderIfAbsent=true',
  'Kirundi':
        'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/e09fe0d3aa10d8d28ffa3f14e436abfb95723099?placeholderIfAbsent=true',
  
  };

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
            setState(() {
              selectedLanguage = newValue!;
            });
          },
          items: languages.entries.map((entry) {
            return DropdownMenuItem<String>(
              value: entry.key,
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: entry.value,
                    width: 28,
                    height: 28,
                    placeholder: (context, url) =>
                        CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error, size: 28),
                  ),
                  SizedBox(width: 12),
                  Text(
                    entry.key,
                    style: AppStyles.body1.copyWith(color: Colors.white),
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
