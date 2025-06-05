import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';

class MonthlyTrainerPageView extends StatefulWidget {
  const MonthlyTrainerPageView({
    super.key,
    required this.border,
    required this.bg,
    required this.borders,
  });

  final AppBorders border;
  final AppBackgrounds bg;
  final AppBorders borders;

  @override
  State<MonthlyTrainerPageView> createState() => _MonthlyTrainerPageViewState();
}

class _MonthlyTrainerPageViewState extends State<MonthlyTrainerPageView> {
  late final PageController _controller;
  late final Timer _timer;
  final int _pageCount = 3;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.8, keepPage: false);
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_controller.hasClients) {
        _currentPage++;
        if (_currentPage >= _pageCount) _currentPage = 0;
        _controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>();
    final bg = widget.bg;
    final border = widget.border;

    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.8,
          child: PageView.builder(
            controller: _controller,
            itemCount: _pageCount,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomCard(
                  borderRadius: 12.r(context),
                  backgroundColor: bg.onSurfacePrimary,
                  borderColor: border.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 96,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  color: Colors.black.withAlpha(26),
                                ),
                                borderRadius: BorderRadius.circular(48),
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                PhosphorIcon(
                                  PhosphorIcons.user(),
                                  size: 90,
                                ),
                                Positioned(
                                  left: -8,
                                  top: 65,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    child:
                                        SvgPicture.asset(AppImages.accounCheck),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text("محمد نور محمد", style: context.xDisplayMedium),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PhosphorIcon(
                                PhosphorIcons.medalMilitary(
                                    PhosphorIconsStyle.fill),
                              ),
                              SizedBox(height: 4),
                              Text(" مدرب الشهر ",
                                  style: context.xParagraphMedium),
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("889"),
                          Text("مراجعة", style: context.xLabelSmall),
                          SizedBox(height: 8),
                          Container(
                            width: 90.w(context),
                            height: 1,
                            color: const Color(0xffE6E6E6),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text("4.7", style: context.xDisplaySmall),
                              PhosphorIcon(
                                size: 16,
                                PhosphorIcons.star(PhosphorIconsStyle.fill),
                                color: content!.warning,
                              ),
                            ],
                          ),
                          Text("التقييم", style: context.xLabelSmall),
                          SizedBox(height: 8),
                          Container(
                            width: 90.w(context),
                            height: 1,
                            color: const Color(0xffE6E6E6),
                          ),
                          SizedBox(height: 8),
                          Text("10", style: context.xDisplaySmall),
                          Text("دورات", style: context.xLabelSmall),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 16),
        SmoothPageIndicator(
          controller: _controller,
          count: _pageCount,
          effect: JumpingDotEffect(
            activeDotColor: bg.primaryBrand,
            dotColor: bg.primaryBrand.withOpacity(0.3),
            dotHeight: 9,
            dotWidth: 9.w(context),
            jumpScale: .9,
            verticalOffset: 25,
          ),
        ),
      ],
    );
  }
}
