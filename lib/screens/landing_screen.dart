import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/download_section_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/hero_section_widget.dart';
import '../widgets/services_section_widget.dart';
import '../widgets/feedback_section_widget.dart';
import '../widgets/footer_widget.dart';
import '../constants/colors.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key? key}) : super(key: key);
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final GlobalKey serviceKey = GlobalKey();
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey footerKey = GlobalKey();
  final GlobalKey downloadKey = GlobalKey();
  bool slider1 = true;
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 1030;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: AnimatedSwitcher(
                    duration: Duration(seconds: 1),
                    switchInCurve: Curves.easeInOut,
                    switchOutCurve: Curves.easeInOut,
                    child: SizedBox.expand(
                        key: ValueKey(slider1),
                      child: Image.asset(
                        slider1
                            ? 'assets/images/slider1.png'
                            : 'assets/images/slider2.png',
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => Center(
                              child: Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 50,
                              ),
                            ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    HeaderWidget(
                      key: homeKey,
                      serviceKey: serviceKey,
                      homeKey: homeKey,
                      footerKey: footerKey,
                      downloadKey: downloadKey,
                      slider1: slider1,
                    ),
                    HeroSectionWidget(
                      slider1: slider1,
                      downloadKey: downloadKey,
                    ),
                  ],
                ),
                // Left and Right Buttons
                if (!isMobile)
                  Positioned(
                    left: 10,
                    top: MediaQuery.of(context).size.height / 2,
                    child: GestureDetector(
                      onTap: () {
                        if (!slider1) {
                          setState(() {
                            slider1 = !slider1;
                          });
                        }
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
                if (!isMobile)
                  Positioned(
                    right: 10,
                    top: MediaQuery.of(context).size.height / 2,
                    child: GestureDetector(
                      onTap: () {
                        if (slider1) {
                          setState(() {
                            slider1 = !slider1;
                          });
                        }
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
                      setState(() {
                        slider1 = !slider1;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          width: slider1 ? 32 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color:
                                slider1
                                    ? AppColors.primary
                                    : AppColors.background,
                            borderRadius: BorderRadius.circular(1000),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: slider1 ? 8 : 32,
                          height: 8,
                          decoration: BoxDecoration(
                            color:
                                slider1
                                    ? AppColors.background
                                    : AppColors.yellow,
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
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width < 800 ? 16 : 80,
              ),
              child: DownloadSectionWidget(key: downloadKey),
            ),
            ServicesSectionWidget(key: serviceKey),
            FeedbackSectionWidget(),
            FooterWidget(
              key: footerKey,
              serviceKey: serviceKey,
              homeKey: homeKey,
              footerKey: footerKey,
              downloadKey: downloadKey,
            ),
          ],
        ),
      ),
    );
  }
}
