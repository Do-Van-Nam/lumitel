import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:get/get.dart';
import '../constants/styles.dart';
import 'language_dropdown_button.dart';

class HeaderWidget extends StatelessWidget {

final GlobalKey serviceKey;
  final GlobalKey homeKey;
  final GlobalKey footerKey;
  final GlobalKey downloadKey;
  final bool slider1;

  const HeaderWidget({
    super.key,
    required this.serviceKey,
    required this.homeKey,
    required this.footerKey,
    required this.downloadKey,
    required this.slider1,
  });
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
              _buildNavItem('header_home'.tr,homeKey),
              _buildNavItem('header_service'.tr,serviceKey),
              _buildNavItem('header_download'.tr,downloadKey),
              _buildNavItem('header_contact'.tr,footerKey),
            ],
          ),

          // _buildLanguageButton(),
          LanguageDropdown(),
        ],
      ),
    );
  }

  Widget _buildNavItem(String text, GlobalKey key) {
    return TextButton(
      onPressed: () {
            Scrollable.ensureVisible(
              key.currentContext!,
              duration: Duration(milliseconds: 600),
              curve: Curves.easeInOut,
            );
          },
     child: Text(
       text,
       style: AppStyles.body1.copyWith(fontWeight: FontWeight.w600,
       color: slider1? AppColors.text : AppColors.neutral4,
       ),
     ),
    );
  }

  }
