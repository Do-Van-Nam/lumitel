import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class FeedbackSectionWidget extends StatelessWidget {
  const FeedbackSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        children: [
          Text(
            'Feedback',
            style: AppStyles.heading1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            children: [
              _buildFeedbackCard(
                'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/09ffc6f069d4f923596d387cc81d99d3313462cb?placeholderIfAbsent=true',
                'Stanislas',
                "Iyi application iratangaje! Ubu ndashobora kuraba amasanamu, gukina udukino, ndetse no kuganira n'abagenzi umwanya umwe. Guhamagarana nta gatotsi birimwo, kandi amashusho ni meza cane. N'ihuriro ririmwo vyose: kwinezereza no kuyaga!",
                false,
              ),
              _buildFeedbackCard(
                'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/909d0d050fdee7c61c33d90b09ff275ad4cef6cf?placeholderIfAbsent=true',
                'Samuel',
                "Nkundira cane bishasha biranga iyi application! Gucishamwo amasanamu no kuraba udukino birakora neza, kandi ndashobora guhindura nkinjira mu dukino canke nka ganira n'abagenzi ata ngorane kandi ntarambiwe. Birabereye cane kuguma ushimishwa kandi uhuzwa n'abandi!",
                true,
              ),
              _buildFeedbackCard(
                'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/ac84d23a92fc2c1759e1490ab5c03825c934c08e?placeholderIfAbsent=true',
                'Abdillahii',
                "Niyo application nziza cane ku bijanye no kwinezereza no kuyaga! Ndashobora kuraba amasanamu, gukina udukino, guhamagara, no kuganira vyose ndabikorera hamwe. Uburyo bwo kuyikoresha bugenda neza, kandi ivyo bimenyetso bishasha biratuma itandukana n'izindi applications.",
                false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeedbackCard(String avatarUrl, String name, String feedback, bool isPrimary) {
    return Container(
      width: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width / 3 - 64,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Color(0xFFF7F9FC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isPrimary ? AppColors.primary : AppColors.neutral4,
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
                backgroundImage: NetworkImage(avatarUrl),
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
                        child: CachedNetworkImage(
                          imageUrl: 'https://cdn.builder.io/api/v1/image/assets/1d620c6ad29d40ac88880f4fa962c9bc/e7814d9f22dae611494f6fd2fc854e777c7d1acc?placeholderIfAbsent=true',
                          width: 17,
                          height: 17,
                          placeholder: (context, url) => SizedBox(
                            width: 17,
                            height: 17,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            size: 17,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24),
          Text(
            feedback,
            style: AppStyles.body1,
          ),
        ],
      ),
    );
  }
}
