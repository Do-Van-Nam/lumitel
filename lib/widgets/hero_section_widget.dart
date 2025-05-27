import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class HeroSectionWidget extends StatelessWidget {
  const HeroSectionWidget({Key? key}) : super(key: key);

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
                      text: 'One-stop digital lifestyle app',
                      style: AppStyles.heading1.copyWith(
                        fontSize: 36,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                "My Lumitel is more than just a mobile app – it's your gateway to seamless communication, entertainment, and account management. Whether you want to connect with loved ones, stream your favorite content, or manage your telecom services, My Lumitel offers it all in one place.",
                style: AppStyles.body1.copyWith(
                  fontSize: 18,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  _buildButton('Download App Lumitel', true),
                  SizedBox(width: 24),
                  _buildButton('Download App LumiCare', false),
                ],
              ),
             
              ],
          ),
          CachedNetworkImage(
            // height: 100,
            width: 450,
            imageUrl:
                'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/fbeb71c1ab60e307ec06fa11079b5637ac164853?placeholderIfAbsent=true',
            fit: BoxFit.contain,
            placeholder:
                (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error, size: 32),
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
                        text: 'MY LUMITEL\n',
                        style: AppStyles.heading1.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      TextSpan(
                        text: 'One-stop digital lifestyle app',
                        style: AppStyles.heading1.copyWith(
                          fontSize: 36,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  "My Lumitel is more than just a mobile app – it's your gateway to seamless communication, entertainment, and account management. Whether you want to connect with loved ones, stream your favorite content, or manage your telecom services, My Lumitel offers it all in one place.",
                  style: AppStyles.body1.copyWith(
                    fontSize: 18,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    _buildButton('Download App Lumitel', true),
                    SizedBox(width: 24),
                    _buildButton('Download App LumiCare', false),
                  ],
                ),
               
                ],
            ),
          ),
          Expanded(
            flex: 1,
            child: CachedNetworkImage(
              // height: 100,
              // width: isMobile ? 300 : 400,
              imageUrl:
                  'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/fbeb71c1ab60e307ec06fa11079b5637ac164853?placeholderIfAbsent=true',
              fit: BoxFit.contain,
              placeholder:
                  (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error, size: 32),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, bool isPrimary) {
    return Container(
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
    );
  }
}
