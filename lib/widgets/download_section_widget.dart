import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class DownloadSectionWidget extends StatelessWidget {
  const DownloadSectionWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
bool isMobile = MediaQuery.of(context).size.width < 1020;
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 64),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0x1A0F1D4B),
            offset: Offset(6, 8),
            blurRadius: 39,
          ),
        ],
      ),
      child: isMobile?
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildDownloadSection(
            'Download App Lumitel',
            'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/3ae630b62b93317cbebf31230653091671c06ded?placeholderIfAbsent=true',
          ),
          SizedBox(height: 24),
          Container(
            width: 174,
            height: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(0, 114, 188, 0), // rgba(0, 114, 188, 0)
                  Color(0xFF0072BC), // #0072BC
                  Color.fromRGBO(0, 114, 188, 0), // rgba(0, 114, 188, 0)
                ],
                stops: [0.0, 0.5288, 1.0],
              ),
            ),
          ),
          SizedBox(height: 24),
          _buildDownloadSection(
            'Download App LumiCare',
            'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/a5f465ea015d707b7ba6dab311724dfc3f5b0383?placeholderIfAbsent=true',
          ),
        ],
      )
      : Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildDownloadSection(
            'Download App Lumitel',
            'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/3ae630b62b93317cbebf31230653091671c06ded?placeholderIfAbsent=true',
          ),
          
          Container(
            width: 4,
            height: 174,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 114, 188, 0), // rgba(0, 114, 188, 0)
                  Color(0xFF0072BC), // #0072BC
                  Color.fromRGBO(0, 114, 188, 0), // rgba(0, 114, 188, 0)
                ],
                stops: [0.0, 0.5288, 1.0],
              ),
            ),
          ),
          
          _buildDownloadSection(
            'Download App LumiCare',
            'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/a5f465ea015d707b7ba6dab311724dfc3f5b0383?placeholderIfAbsent=true',
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadSection(String title, String qrImageUrl) {
    return Container(
      width: 390,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.heading2,
          ),
          SizedBox(height: 32),
          Row(
            children: [
              Container(
                width: 180,
                height: 180,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.3),
                    width: 4,
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: qrImageUrl,
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(width: 40),
              Column(
                children: [
                  _buildDownloadOption(
                    true,
                    'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/334f9b23ce0657e7f1b81190bb8865e2212feec6?placeholderIfAbsent=true',
                    'Free Data Usage',
                    'Download APK',
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: 170,
                    height: 48,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/428d7f6c3de8e94316626777a1a818e13bb9111c?placeholderIfAbsent=true',
                      fit: BoxFit.contain,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: 170,
                    height: 48,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/cb34daf70e1dd1bf47801fad47f407dd049fdbe8?placeholderIfAbsent=true',
                      width: 120,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadOption(
    bool isYellow,
    String iconUrl,
    String subtitle,
    String title,
  ) {
    return Container(
      width: 170,
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: isYellow ? Color(0xFFFFF200) : AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: iconUrl,
            width: 32,
            height: 32,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
          SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: AppStyles.googleSans,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: AppStyles.googleSans,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
