import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
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
      child:
          isMobile
              ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildDownloadSection(
                    'hero_download_lumitel'.tr,
                    'assets/images/qr_lumitel.png',
                    'lumitel',
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
                          Color.fromRGBO(
                            0,
                            114,
                            188,
                            0,
                          ), // rgba(0, 114, 188, 0)
                          Color(0xFF0072BC), // #0072BC
                          Color.fromRGBO(
                            0,
                            114,
                            188,
                            0,
                          ), // rgba(0, 114, 188, 0)
                        ],
                        stops: [0.0, 0.5288, 1.0],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  _buildDownloadSection(
                    'hero_download_lumicare'.tr,
                    'assets/images/qr_lumicare.png',
                    'lumicare',
                  ),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildDownloadSection(
                    'hero_download_lumitel'.tr,
                    'assets/images/qr_lumitel.png',
                    'lumitel',
                  ),

                  Container(
                    width: 4,
                    height: 174,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(
                            0,
                            114,
                            188,
                            0,
                          ), // rgba(0, 114, 188, 0)
                          Color(0xFF0072BC), // #0072BC
                          Color.fromRGBO(
                            0,
                            114,
                            188,
                            0,
                          ), // rgba(0, 114, 188, 0)
                        ],
                        stops: [0.0, 0.5288, 1.0],
                      ),
                    ),
                  ),

                  _buildDownloadSection(
                    'hero_download_lumicare'.tr,
                    'assets/images/qr_lumicare.png',
                    'lumicare',
                  ),
                ],
              ),
    );
  }

  Widget _buildDownloadSection(String title, String qrImageUrl, String appName) {
    return Container(
      width: 390,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: AppStyles.heading2),
          SizedBox(height: 32),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.spaceAround,
         runAlignment: WrapAlignment.center,

         crossAxisAlignment: WrapCrossAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 180,
                height: 180,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.3),
                    width: 4,
                  ),
                ),
                child: Image.asset(
                  qrImageUrl,
                  width: 170,
                  height: 170,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error, color: Colors.red);
                  },
                ),
              ),
              // SizedBox(width: 40),
              Column(
                children: [
                  buildDownloadOption(
                    'yellow',
                    'assets/icons/apk_icon.png',
                    'free_data_usage'.tr,
                    'download_apk'.tr,
                    appName == 'lumitel'
                        ? 'https://selfcare-my.lumitel.bi/lumitel-api-v2/without-bearer/download/apk?app=MyLumitel'
                        : 'https://selfcare-my.lumitel.bi/lumitel-api-v2/without-bearer/download/apk?app=LumiCare',
                  ),
                  SizedBox(height: 12),
                  buildDownloadOption(
                    'blue',
                    'assets/icons/google_play.png',
                    'get_it_on'.tr,
                    'Google Play',
                   appName == 'lumitel'
                       ? 'https://play.google.com/store/apps/details?id=com.lumitel.superapp'
                       : 'https://play.google.com/store/apps/details?id=com.ringme.lumicare',
                  ),SizedBox(height: 12),
                  buildDownloadOption(
                    'white',
                    'assets/icons/appstore_icon.png',
                    'download_on_the'.tr,
                    'App Store',
                    appName == 'lumitel'
                        ? 'https://apps.apple.com/vn/app/my-lumitel/id1586124527'
                        : 'https://apps.apple.com/vn/app/my-lumitel/id1586124527'
                  ), ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  
}
Widget buildDownloadOption(
    String color,
    String iconUrl,
    String subtitle,
    String title,
    String link,
  ) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(link)),
      child: Container(
        width: 170,
        // height: 55,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: color == 'yellow' 
              ? AppColors.yellow 
              : color == 'white' 
                  ? AppColors.background 
                  : AppColors.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0x40000000), // #00000040
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              iconUrl,
              width: 32,
              height: 32,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, color: Colors.red);
              },
            ),
            SizedBox(width: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 118,
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: AppStyles.googleSans,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    softWrap: true,
    maxLines: 3,
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: AppStyles.googleSans,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    softWrap: true,
    maxLines: 3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }