import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class FeedbackSectionWidget extends StatelessWidget {
  const FeedbackSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 80),

      margin: EdgeInsets.only(bottom: 32),
      child: Column(
        children: [
          Text(
            'feedback_title'.tr,
            style: AppStyles.heading1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48),
         !isMobile? 
         
         IntrinsicHeight(
           child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildFeedbackCard(
                'assets/icons/feedback_avatar1.png',
                    'Stanislas',
                    "Iyi application iratangaje! Ubu ndashobora kuraba amasanamu, gukina udukino, ndetse no kuganira n'abagenzi umwanya umwe. Guhamagarana nta gatotsi birimwo, kandi amashusho ni meza cane. N'ihuriro ririmwo vyose: kwinezereza no kuyaga!",
                   
                  ),
                ),
                SizedBox(width: 16), 
                Expanded(
                  child: _buildFeedbackCard(
                'assets/icons/feedback_avatar2.png',
                    'Samuel',
                    "Nkundira cane bishasha biranga iyi application! Gucishamwo amasanamu no kuraba udukino birakora neza, kandi ndashobora guhindura nkinjira mu dukino canke nka ganira n'abagenzi ata ngorane kandi ntarambiwe. Birabereye cane kuguma ushimishwa kandi uhuzwa n'abandi!",
                  
                  ),
                ),
                SizedBox(width: 16), 
                Expanded(
                  child: _buildFeedbackCard(
                'assets/icons/feedback_avatar3.png',
                    'Abdillahii',
                    "Niyo application nziza cane ku bijanye no kwinezereza no kuyaga! Ndashobora kuraba amasanamu, gukina udukino, guhamagara, no kuganira vyose ndabikorera hamwe. Uburyo bwo kuyikoresha bugenda neza, kandi ivyo bimenyetso bishasha biratuma itandukana n'izindi applications.",
                             
                  ),
                ),
              ],
            ),
         ): Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildFeedbackCard(
                'assets/icons/feedback_avatar1.png',
                'Stanislas',
                "Iyi application iratangaje! Ubu ndashobora kuraba amasanamu, gukina udukino, ndetse no kuganira n'abagenzi umwanya umwe. Guhamagarana nta gatotsi birimwo, kandi amashusho ni meza cane. N'ihuriro ririmwo vyose: kwinezereza no kuyaga!",
               
              ),
              SizedBox(height: 16),
              _buildFeedbackCard(
                'assets/icons/feedback_avatar2.png',
                'Samuel',
                "Nkundira cane bishasha biranga iyi application! Gucishamwo amasanamu no kuraba udukino birakora neza, kandi ndashobora guhindura nkinjira mu dukino canke nka ganira n'abagenzi ata ngorane kandi ntarambiwe. Birabereye cane kuguma ushimishwa kandi uhuzwa n'abandi!",
              
              ),
              SizedBox(height: 16),
              _buildFeedbackCard(
                'assets/icons/feedback_avatar3.png',
                'Abdillahii',
                "Niyo application nziza cane ku bijanye no kwinezereza no kuyaga! Ndashobora kuraba amasanamu, gukina udukino, guhamagara, no kuganira vyose ndabikorera hamwe. Uburyo bwo kuyikoresha bugenda neza, kandi ivyo bimenyetso bishasha biratuma itandukana n'izindi applications.",
           
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeedbackCard(
    String avatarUrl,
    String name,
    String feedback,
  ) {
        bool isHovered = false;
    return StatefulBuilder(
      builder: (context, setState) {

        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Color(0xFFF7F9FC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isHovered ? AppColors.primary : AppColors.neutral4,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x1A0F1D4B),
                  offset: Offset(5.898, 7.864),
                  blurRadius: 39.318,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 27,
                      backgroundImage: AssetImage(avatarUrl),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: AppStyles.heading2.copyWith(fontSize: 18),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Padding(
                              padding: EdgeInsets.only(right: 2),
                              child: Image.asset(
                                'assets/icons/star.png',
                                width: 17,
                                height: 17,
                                errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, size: 32);
            },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text(feedback, style: AppStyles.body1),
              ],
            ),
          ),
        );
      },
    );
  }
}
