import 'package:flutter/material.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/list_tile_card.dart';

class SectionCardBuilder extends StatelessWidget {
  const SectionCardBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 8.h(context)),
          child: ListTileCard(
            iconAsset: AppImages.pdfIcon,
            index: index,
            title: "مقدمة",
            subTitle: "15:17 دقيقة",
          ),
        );
      },
    );
  }
}
