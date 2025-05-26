import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 900;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal:isMobile? 16: 80, vertical: 32),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.neutral4)),
            color: AppColors.text,
          ),
          child: Column(
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

  Widget _buildNewsletterSection(context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      width: double.infinity,
      // padding: EdgeInsets.symmetric(horizontal: 80, vertical: 24),
      child: Wrap(
        spacing: 48,
        runSpacing: 16, // khoảng cách dọc giữa các dòng nếu có xuống dòng
        crossAxisAlignment:
            isMobile ? WrapCrossAlignment.center : WrapCrossAlignment.start,
        alignment: isMobile ? WrapAlignment.center : WrapAlignment.spaceBetween,

        children: [
          Text(
            'Join our newsletter to keep up to date with us!',
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
                    decoration: InputDecoration(
                      hintText: 'Enter your email or phone',
                      hintStyle: AppStyles.body1.copyWith(
                        color: Color(0xFF545664),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 11),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Subscribe',
                    style: AppStyles.button.copyWith(color: AppColors.yellow),
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
    return isMobile ? Column(
crossAxisAlignment: CrossAxisAlignment.start,
      
children: [
        SizedBox(
          width: 400,
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
                'MY LUMITEL\nFree entertainment',
                style: AppStyles.heading2.copyWith(color: AppColors.background),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFooterLink('Home'),
            SizedBox(height: 16),
            _buildFooterLink('Service'),
            SizedBox(height: 16),
            _buildFooterLink('Download App'),
            SizedBox(height: 16),
            _buildFooterLink('Contact'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get the app',
              style: AppStyles.body1.copyWith(color: AppColors.background),
            ),
            SizedBox(height: 16),
            Container(
              width: 160,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/c6731e856096110c03ee833444b4b1fb50b82b12?placeholderIfAbsent=true',
                  width: 138,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget:
                      (context, url, error) =>
                          Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: 160,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/4dd215d752f520dd6ff9aa7bf7c48551532f7c09?placeholderIfAbsent=true',
                  width: 120,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget:
                      (context, url, error) =>
                          Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ],
    ) :Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 400,
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
                'MY LUMITEL\nFree entertainment',
                style: AppStyles.heading2.copyWith(color: AppColors.background),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFooterLink('Home'),
            SizedBox(height: 16),
            _buildFooterLink('Service'),
            SizedBox(height: 16),
            _buildFooterLink('Download App'),
            SizedBox(height: 16),
            _buildFooterLink('Contact'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get the app',
              style: AppStyles.body1.copyWith(color: AppColors.background),
            ),
            SizedBox(height: 16),
            Container(
              width: 160,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/c6731e856096110c03ee833444b4b1fb50b82b12?placeholderIfAbsent=true',
                  width: 138,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget:
                      (context, url, error) =>
                          Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: 160,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/4dd215d752f520dd6ff9aa7bf7c48551532f7c09?placeholderIfAbsent=true',
                  width: 120,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget:
                      (context, url, error) =>
                          Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFooterLink(String text) {
    return Text(
      text,
      style: AppStyles.button.copyWith(color: AppColors.background),
    );
  }

  Widget _buildCopyright(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    // Responsive padding: nhỏ hơn thì giảm padding
    final horizontalPadding = screenWidth < 600 ? 16.0 : 80.0;

    // Responsive alignment: nhỏ hơn thì căn giữa
    final alignment =
        screenWidth < 600 ? WrapAlignment.center : WrapAlignment.spaceBetween;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 24,
      ),
      color: AppColors.yellow,
      child: Wrap(
        spacing: 48,
        runSpacing: 16, // khoảng cách dọc giữa các dòng nếu có xuống dòng
        crossAxisAlignment:
            isMobile ? WrapCrossAlignment.center : WrapCrossAlignment.start,
        alignment: isMobile ? WrapAlignment.center : WrapAlignment.spaceBetween,

        children: [
          Text(
            '© 2024 Lumitel Inc. All rights reserved.',
            style: AppStyles.body1,
            textAlign: TextAlign.center,
          ),
          // Đổi Row thành Wrap để tránh lỗi tràn dòng khi màn hình hẹp
          Wrap(
            spacing: 32,
            alignment: WrapAlignment.center,
            children: [
              Text('Terms of Service', style: AppStyles.body1),
              Text('Privacy Policy', style: AppStyles.body1),
              Text('Cookies', style: AppStyles.body1),
            ],
          ),
        ],
      ),
    );
  }
}
