import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class ServicesSectionWidget extends StatelessWidget {
  const ServicesSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;
    return Container(
      padding: EdgeInsets.symmetric(horizontal:isMobile?16: 80),
      margin: EdgeInsets.only(top: 74),
      child: Column(
        children: [
          Text(
            'services_section_title'.tr,
            style: AppStyles.heading1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48),
        isMobile? Column(
          children: [
            Image.asset(
          'assets/images/services_img.png',
            width: 450,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, size: 32);
            },
          ),
          SizedBox(height: 16,),
                _buildServiceCard(
                              'assets/icons/chat_icon.png',
                              'services_chat_title'.tr,
                              'services_chat_description'.tr ),
                          SizedBox(height: 16),
                            _buildServiceCard( 
                              'assets/icons/video_icon.png',
                              'services_movie_title'.tr,
                              'services_movie_description'.tr,
                            ),
                          SizedBox(height: 16),
                            _buildServiceCard(
                              'assets/icons/music_icon.png',
                              'services_music_title'.tr,
                              'services_music_description'.tr,
                            ),
                          SizedBox(height: 16),
                            _buildServiceCard(
                              'assets/icons/game_icon.png',
                              'services_game_title'.tr,
                              'services_game_description'.tr,
                            ),
                            SizedBox(height: 16,)
          ],
        ):  Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  // height: 100,
                  width: 450,
                  'assets/images/services_img.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, size: 32);
            },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildServiceCard(
                              'assets/icons/chat_icon.png',
                              'services_chat_title'.tr,
                              'services_chat_description'.tr,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: _buildServiceCard(
                              'assets/icons/video_icon.png',
                              'services_movie_title'.tr,
                              'services_movie_description'.tr,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildServiceCard(
                              'assets/icons/music_icon.png',
                              'services_music_title'.tr,
                              'services_music_description'.tr,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: _buildServiceCard(
                              'assets/icons/game_icon.png',
                              'services_game_title'.tr,
                              'services_game_description'.tr,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String imageUrl, String title, String description) {
    bool isHovered = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: Container(
            // width: 314,
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
                Image.asset(
                  imageUrl,
                  width: 48,
                  height: 48,
                  errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, size: 32);
            },
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppStyles.heading2),
                      SizedBox(height: 12),
                      Text(description, style: AppStyles.body1),
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
