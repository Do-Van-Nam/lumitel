import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/download_section_widget.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import 'dart:html' as html; 

class FooterWidget extends StatelessWidget {
final GlobalKey serviceKey;
  final GlobalKey homeKey;
  final GlobalKey footerKey;
  final GlobalKey downloadKey;

  const FooterWidget({
    super.key,
    required this.serviceKey,
    required this.homeKey,
    required this.footerKey,
    required this.downloadKey,
  });
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 900;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 80,
            vertical: 32,
          ),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.neutral4)),
            color: AppColors.text,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNewsletterSection(context),
              SizedBox(height: 24),
              _buildFooterLinks(context),
            ],
          ),
        ),
        _buildCopyright(context),
      ],
    );
  }

Widget _buildNewsletterSection(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
  final TextEditingController _controller = TextEditingController();

  void _handleSubscription() {
                  final input = _controller.text;
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                  final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');

                  if (emailRegex.hasMatch(input) || phoneRegex.hasMatch(input)) {
      _showMessageDialog(context, true);
                  } else {
      _showMessageDialog(context, false);
                  }
  }

  return Container(
    width: double.infinity,
    margin: MediaQuery.of(context).size.width > 600 ? EdgeInsets.only(left: 24) : EdgeInsets.zero,
    child: Wrap(
      spacing: 48,
      runSpacing: 16,
      crossAxisAlignment: isMobile ? WrapCrossAlignment.center : WrapCrossAlignment.start,
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.spaceBetween,
      children: [
        Text(
          'footer_Subscribe_description'.tr,
          style: AppStyles.heading2.copyWith(
            color: AppColors.background,
            height: 1.2,
            ),
          ),
        Container(
          width: 360,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.darkBackground,
            borderRadius: BorderRadius.circular(12),
      ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'footer_email_placeholder'.tr,
                    hintStyle: AppStyles.body1.copyWith(
                      color: Color(0xFF545664),
        ),
                    border: InputBorder.none,
    ),
                  onSubmitted: (_) => _handleSubscription(),
        ),
    ),
              GestureDetector(
                onTap: _handleSubscription,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 11),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'footer_subscribe_button'.tr,
                    style: AppStyles.button.copyWith(color: AppColors.yellow),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  }

  Widget _buildFooterLinks(context) {
    bool isMobile = MediaQuery.of(context).size.width < 900;
    return isMobile
        ? Container(
         margin:MediaQuery.of(context).size.width > 600?  EdgeInsets.only(left: 24): EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          
            children: [
              SizedBox(
                width: 330,
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/8d8b49e5a7cf60f7a5df73476783eec6c863cf25?placeholderIfAbsent=true',
                      width: 100,
                      placeholder:
                          (context, url) => SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(child: CircularProgressIndicator()),
                          ),
                      errorWidget:
                          (context, url, error) => SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: Icon(Icons.broken_image, color: Colors.grey),
                            ),
                          ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'MY LUMITEL\n${'free_entertainment'.tr}',
                      style: AppStyles.heading2.copyWith(
                        color: AppColors.background,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFooterLink('header_home'.tr,homeKey),
                  SizedBox(height: 16),
                  _buildFooterLink('header_service'.tr,serviceKey),
                  SizedBox(height: 16),
                  _buildFooterLink('header_download'.tr,downloadKey),
                  SizedBox(height: 16),
                  _buildFooterLink('header_contact'.tr,footerKey),
                ],
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'download'.tr,
                    style: AppStyles.body1.copyWith(color: AppColors.background),
                  ),
                  SizedBox(height: 16),
                  buildDownloadOption(
                    'blue',
                    'assets/icons/google_play.png',
                    'get_it_on'.tr,
                    'Google Play',
                    'https://play.google.com/store/apps/details?id=com.lumitel.superapp'
                  ), SizedBox(height: 16),
                  buildDownloadOption(
                    'white',
                    'assets/icons/appstore_icon.png',
                    'download_on_the'.tr,
                    'App Store',
                    'https://apps.apple.com/vn/app/my-lumitel/id1586124527'
                  ),  ],
              ),
            ],
          ),
        )
        : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 330,
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/8d8b49e5a7cf60f7a5df73476783eec6c863cf25?placeholderIfAbsent=true',
                    width: 100,
                    placeholder:
                        (context, url) => SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                    errorWidget:
                        (context, url, error) => SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Icon(Icons.broken_image, color: Colors.grey),
                          ),
                        ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'MY LUMITEL\n${'free_entertainment'.tr}',
                    style: AppStyles.heading2.copyWith(
                      color: AppColors.background,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFooterLink('header_home'.tr,homeKey),
                SizedBox(height: 16),
                _buildFooterLink('header_service'.tr,serviceKey),
                SizedBox(height: 16),
                _buildFooterLink('header_download'.tr,downloadKey),
                SizedBox(height: 16),
                _buildFooterLink('header_contact'.tr,footerKey),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'download'.tr,
                  style: AppStyles.body1.copyWith(color: AppColors.background),
                ),
                SizedBox(height: 16),
                buildDownloadOption(
                    'blue',
                    'assets/icons/google_play.png',
                    'get_it_on'.tr,
                    'Google Play',
                    'https://play.google.com/store/apps/details?id=com.lumitel.superapp'
                  ),SizedBox(height: 16),
               buildDownloadOption(
                    'white',
                    'assets/icons/appstore_icon.png',
                    'download_on_the'.tr,
                    'App Store',
                    'https://apps.apple.com/vn/app/my-lumitel/id1586124527'
                  ),   ],
            ),
          ],
        );
  }

  Widget _buildFooterLink(String text,GlobalKey key) {
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
       style: AppStyles.body1.copyWith(color: Colors.white),
     ),
    );
  }


  Widget _buildCopyright(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    // Responsive padding: nhỏ hơn thì giảm padding
    final horizontalPadding = screenWidth < 600 ? 16.0 : 80.0;

    // Responsive alignment: nhỏ hơn thì căn giữa

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 24,
      ),
      color: AppColors.yellow,
      child: Wrap(
        spacing: 48,
        runSpacing: 16, 
        crossAxisAlignment:
            isMobile ? WrapCrossAlignment.center : WrapCrossAlignment.start,
        alignment: isMobile ? WrapAlignment.center : WrapAlignment.spaceBetween,

        children: [
          Text(
            'footer_copy_right'.tr,
            style: AppStyles.body1,
            textAlign: TextAlign.center,
          ),
          
          Wrap(
            spacing: 32,
            alignment: WrapAlignment.center,
            children: [
              GestureDetector(
                onTap: () => {
                  html.window.location.href = 'https://my.lumitel.bi/app/privacy.html'
                },
                child: Text('footer_terms'.tr, style: AppStyles.body1),
              ),
              GestureDetector(
                onTap: () => {
                  html.window.location.href = 'https://my.lumitel.bi/app/privacy.html'
                },
                child: Text('footer_privacy'.tr, style: AppStyles.body1),
              ),
              GestureDetector(
                onTap: () => {
                  html.window.location.href = 'https://do-van-nam.github.io/lumitel-landing-page/'
                },
                child: Text('footer_cookies'.tr, style: AppStyles.body1),
              ),

            
            ],
          ),
        ],
      ),
    );
  }

void _showMessageDialog(BuildContext context, bool isSuccessful) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
          color: isSuccessful ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
            constraints: BoxConstraints(maxWidth: 280),
            child: Text(
              isSuccessful
                  ? 'subscribe_success'.tr
                  : 'invalid_format'.tr,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: 20, right: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Colors.transparent, 
      elevation: 0, 
    ),
  );
}

}
