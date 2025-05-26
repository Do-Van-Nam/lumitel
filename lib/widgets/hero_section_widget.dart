import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class HeroSectionWidget extends StatelessWidget {
  const HeroSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      margin: EdgeInsets.only(top: 42),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 54,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/592f2629d449be18533fdcc7dbe94a2223899a91?placeholderIfAbsent=true',
                      width: 32,
                      height: 32,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error, size: 32),
                    ),
                    SizedBox(width: 16),
                    Expanded(
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
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    _buildButton(
                      'Download App Lumitel',
                      true,
                    ),
                    SizedBox(width: 24),
                    _buildButton(
                      'Download App LumiCare',
                      false,
                    ),
                  ],
                ),
                SizedBox(height: 69),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 32,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(1000),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(4),
          ),
      ),
                  ],
        ),
              ],
      ),
          ),
          Expanded(
            flex: 46,
            child: Row(
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/fbeb71c1ab60e307ec06fa11079b5637ac164853?placeholderIfAbsent=true',
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error, size: 32),
                  ),
                ),
                CachedNetworkImage(
                  imageUrl:
                      'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/16ca2df4f3bcd3f06c1183b0e8e1117f530010e6?placeholderIfAbsent=true',
                  width: 32,
                  height: 32,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, size: 32),
                ),
              ],
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
