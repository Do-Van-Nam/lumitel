import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import 'language_dropdown_button.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isMobile? 16: 80, vertical: 24),
      child: Wrap(
        spacing: 48,
        runSpacing: 16, // khoảng cách dọc giữa các dòng nếu có xuống dòng
        crossAxisAlignment:
            isMobile ? WrapCrossAlignment.center : WrapCrossAlignment.start,
        alignment: isMobile ? WrapAlignment.center : WrapAlignment.spaceBetween,
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/f9d19e0dcaad89f376a39a53991922162161ea43?placeholderIfAbsent=true',
            width: 100,
            fit: BoxFit.contain,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error, size: 100),
          ),

          Wrap(
            spacing: 48,
            runSpacing: 16, // khoảng cách dọc giữa các dòng nếu có xuống dòng
            crossAxisAlignment:
                WrapCrossAlignment.center, // hoặc start / end tùy mục đích
            alignment:
                WrapAlignment.center, // canh giữa các phần tử theo chiều ngang
            children: [
              _buildNavItem('Home'),
              _buildNavItem('Service'),
              _buildNavItem('Download App'),
              _buildNavItem('Contact'),
            ],
          ),

          // _buildLanguageButton(),
          LanguageDropdown(),
        ],
      ),
    );
  }

  Widget _buildNavItem(String text) {
    return Text(
      text,
      style: AppStyles.body1.copyWith(fontWeight: FontWeight.w600),
    );
  }

  Widget _buildLanguageButton() {
        String selectedLanguage = 'English'; // Default selected language
        bool isDropdownVisible = false; // Track dropdown visibility
    return StatefulBuilder(
      builder: (context, setState) {

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isDropdownVisible =
                      !isDropdownVisible; // Toggle dropdown visibility
                });
              },
              child: Container(
                width: 160,
                height: 48,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedLanguage,
                      style: AppStyles.button.copyWith(color: Colors.white),
                    ),
                    Icon(
                      isDropdownVisible
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
            if (isDropdownVisible)
              Container(
                margin: EdgeInsets.only(top: 8),
                width: 160,
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
                child: Column(
                  children:
                      ['English', 'French'].map((String value) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedLanguage =
                                  value; // Update selected language
                              isDropdownVisible = false; // Close dropdown
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                      'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/e09fe0d3aa10d8d28ffa3f14e436abfb95723099?placeholderIfAbsent=true',
                                  width: 28,
                                  height: 28,
                                  placeholder:
                                      (context, url) =>
                                          CircularProgressIndicator(),
                                  errorWidget:
                                      (context, url, error) =>
                                          Icon(Icons.error, size: 28),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  value,
                                  style: AppStyles.body1.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
          ],
        );
      },
    );
  }
}
