import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class ServicesSectionWidget extends StatelessWidget {
  const ServicesSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80),
      margin: EdgeInsets.only(top: 74),
      child: Column(
        children: [
          Text(
            'Services',
            style: AppStyles.heading1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            children: [
              _buildServiceCard(
                'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/b6df7fd857a78902075a476e9354c5ce2946c8d0?placeholderIfAbsent=true',
                'Chat/Call free',
                "Stay connected with unlimited free calls and chats through My Lumitel's user-friendly and reliable communication tools.",
                true,
              ),
              _buildServiceCard(
                'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/8343e02839343c3f02d1d0649030ec5fd8dc4fc5?placeholderIfAbsent=true',
                'Movie/Video',
                "Enjoy a vast library of movies and videos, available at your fingertips for endless entertainment.",
                false,
              ),
              _buildServiceCard(
                'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/5eb8957a9a4bfad98dfede60fa9cb79e39f3c1aa?placeholderIfAbsent=true',
                'Music',
                "Discover and listen to a diverse selection of music genres, with an easy-to-use interface for the ultimate listening experience.",
                false,
              ),
              _buildServiceCard(
                'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/723077b8006ed2d5327af002f052fc67a57ba99f?placeholderIfAbsent=true',
                'Game',
                "Play a wide variety of engaging games, designed to provide fun and excitement right on your device.",
                false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String imageUrl, String title, String description, bool isPrimary) {
    bool isHovered = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: Container(
      width: 314,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Color(0xFFF7F9FC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isHovered ? AppColors.primary : AppColors.neutral4,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x1A0F1D4B),
            offset: Offset(5.898, 7.864),
            blurRadius: 39.318,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            width: 48,
            height: 48,
            placeholder: (context, url) => Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              child: Icon(
                Icons.broken_image,
                color: Colors.grey,
                size: 48,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.heading2,
                ),
                SizedBox(height: 12),
                Text(
                  description,
                  style: AppStyles.body1,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
 
        );
      },
    );
    
     }
}
