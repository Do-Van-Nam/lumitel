import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class HeroSectionWidget extends StatelessWidget {
  const HeroSectionWidget({Key? key, required this.slider1, required this.downloadKey}) : super(key: key);
  final bool slider1;
  final GlobalKey downloadKey;
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 1030;
    return Container(
      padding: EdgeInsets.symmetric(horizontal:isMobile?16: 80),
      width: double.infinity,
      // margin: EdgeInsets.only(top: 12),
      child: isMobile? Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'MY LUMITEL\n',
                      style: AppStyles.heading1.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: slider1? 'hero_title'.tr : 'lumicare_title'.tr,
                      style: AppStyles.heading1.copyWith(
                        fontSize: 36,
                        height: 1.5,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
               slider1? 'hero_description'.tr : 'lumicare_description'.tr,
                style: AppStyles.body1.copyWith(
                  fontSize: 18,
                  height: 1.4,
                  color: slider1? AppColors.text : AppColors.neutral4,
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  _buildButton('hero_download_lumitel'.tr, true),
                  SizedBox(width: 24),
                  _buildButton('hero_download_lumicare'.tr, false),
                ],
              ),
             
              ],
          ),
          Image.asset(
           slider1? 'assets/images/slider1_img.png':'assets/images/slider2_img.png',
            width: 450,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, size: 32);
            },
          ),
      ],
      ): Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: slider1? 'MY LUMITEL\n' : 'LumiCare\n',
                        style: AppStyles.heading1.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      TextSpan(
                        text: slider1? 'hero_title'.tr : 'lumicare_title'.tr,
                        style: AppStyles.heading1.copyWith(
                          fontSize: 36,
                          height: 1.5,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Text(
                 slider1? 'hero_description'.tr : 'lumicare_description'.tr,
                  style: AppStyles.body1.copyWith(
                    fontSize: 18,
                    height: 1.4,
                    color: slider1? AppColors.text : AppColors.neutral4,
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    _buildButton('hero_download_lumitel'.tr, true),
                    SizedBox(width: 24),
                    _buildButton('hero_download_lumicare'.tr, false),
                  ],
                ),
               
                ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Image.asset(
           slider1? 'assets/images/slider1_img.png':'assets/images/slider2_img.png',

            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, size: 32);
            },
          ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, bool isPrimary) {
    return GestureDetector(
      onTap: () => Scrollable.ensureVisible(
        downloadKey.currentContext!,
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        decoration: BoxDecoration(
          color: isPrimary ? AppColors.primary : AppColors.background,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0x1A084268),
              offset: Offset(0, 4),
              blurRadius: 20,
            ),
          ],
        ),
        child: Text(
          text,
          style: AppStyles.button.copyWith(
            color: isPrimary ? AppColors.background : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
