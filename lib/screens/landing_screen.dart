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
    bool isMobile = MediaQuery.of(context).size.width < 1030;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/e65016b6d64c8aab702aad7857817aee2b183322?placeholderIfAbsent=true',
                    fit: BoxFit.cover,
                    placeholder:
                        (context, url) =>
                            Center(child: CircularProgressIndicator()),
                    errorWidget:
                        (context, url, error) => Center(
                          child: Icon(Icons.error, color: Colors.red, size: 50),
                        ),
                  ),
                ),
                Column(children: [HeaderWidget(), HeroSectionWidget()]),
                // Left and Right Buttons
            if(!isMobile)    Positioned(
                  left: 10,
                  top: MediaQuery.of(context).size.height / 2,
                  child: GestureDetector(
                    onTap: () {
                      // Add your left button action here
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                ),
            if(!isMobile)     Positioned(
                  right: 10,
                  top: MediaQuery.of(context).size.height / 2,
                  child: GestureDetector(
                    onTap: () {
                      // Add your left button action here
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_forward, color: Colors.black),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: MediaQuery.of(context).size.width / 2 - 25,
                  child: GestureDetector(
                    onTap: () {
                      // Add your bottom button action here
                    },
                    child: Row(
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
                  ),
                ),
              ],
            ),
            // Download Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width < 800 ? 16 : 80),
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
