import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/download_section_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/hero_section_widget.dart';
import '../widgets/services_section_widget.dart';
import '../widgets/feedback_section_widget.dart';
import '../widgets/footer_widget.dart';
import '../constants/colors.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/8840f900952c308c7b2d1f16425c2cbea3f5db20?placeholderIfAbsent=true',
                  width: double.infinity,
                  height: 595,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 50,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 595,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.5),
                      BlendMode.screen,
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/e65016b6d64c8aab702aad7857817aee2b183322?placeholderIfAbsent=true',
                      width: double.infinity,
                      height: 595,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    HeaderWidget(),
                    HeroSectionWidget(),
                  ],
                ),
              ],
            ),
            // Download Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: DownloadSectionWidget(),
            ),
            ServicesSectionWidget(),
            FeedbackSectionWidget(),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
