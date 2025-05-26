import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/f9d19e0dcaad89f376a39a53991922162161ea43?placeholderIfAbsent=true',
            width: 100,
            fit: BoxFit.contain,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error, size: 100),
          ),
          Row(
            children: [
              _buildNavItem('Home'),
              SizedBox(width: 48),
              _buildNavItem('Service'),
              SizedBox(width: 48),
              _buildNavItem('Download App'),
              SizedBox(width: 48),
              _buildNavItem('Contact'),
            ],
          ),
          _buildLanguageButton(),
        ],
      ),
    );
  }

  Widget _buildNavItem(String text) {
    return Text(
      text,
      style: AppStyles.body1.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildLanguageButton() {
    return Container(
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
          Row(
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/e09fe0d3aa10d8d28ffa3f14e436abfb95723099?placeholderIfAbsent=true',
                width: 28,
                height: 28,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error, size: 28),
              ),
              SizedBox(width: 12),
              Text(
                'Kirundi',
                style: AppStyles.button,
              ),
            ],
          ),
          CachedNetworkImage(
            imageUrl:
                'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/07ea530e329189a84510835455b762bf9799650a?placeholderIfAbsent=true',
            width: 24,
            height: 24,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error, size: 24),
          ),
        ],
      ),
    );
  }
}
