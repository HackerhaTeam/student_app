import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/constants/assets.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class PdfFilesViewer extends StatelessWidget {
  const PdfFilesViewer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final files = [
      {"name": "Session 1.0.pdf", "icon": PhosphorIcons.downloadSimple()},
      {"name": "Session 1.1.pdf", "icon": PhosphorIcons.downloadSimple()},
    ];
    final border = Theme.of(context).extension<AppBorders>()!;
    final styles = context;
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 40.w(context),
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r(context)),
            border: Border.all(color: border.transparent)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(files.length, (index) {
            final file = files[index];
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.pdfIcon,
                        width: 28,
                        height: 28,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          file["name"] as String,
                          style: styles.xLabelLarge
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Icon(file["icon"] as IconData,
                          color: Colors.white, size: 24),
                    ],
                  ),
                ),
                if (index < files.length - 1)
                  Container(
                    height: 1,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey.shade900,
                          Colors.grey.shade700,
                          Colors.grey.shade900
                        ],
                      ),
                    ),
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
