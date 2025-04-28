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
    final textTheme = Theme.of(context).textTheme;
    final bg = widget.bg;
    final border = widget.border;

    return SizedBox(
      height: 270.h(context),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: _pageCount,
              itemBuilder: (BuildContext context, int index) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(16.r(context)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: bg.onSurfacePrimary,
                        border: Border.all(color: border.transparent),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 96,
                                height: 96,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 2,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
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
                                        child: SvgPicture.asset(
                                            AppImages.accounCheck),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text("محمد نور محمد",
                                  style: context.xDisplayMedium),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PhosphorIcon(PhosphorIcons.medalMilitary(
                                      PhosphorIconsStyle.fill)),
                                  SizedBox(height: 4.h(context)),
                                  Center(
                                    child: Text(" مدرب الشهر ",
                                        textAlign: TextAlign.center,
                                        style: context.xParagraphMedium),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(889.toString()),
                              Text("مراجعة", style: context.xLabelSmall),
                              SizedBox(height: 8.h(context)),
                              Container(
                                width: 90.w(context),
                                height: 1.h(context),
                                color: const Color(0xffE6E6E6),
                              ),
                              SizedBox(height: 8.h(context)),
                              Row(
                                children: [
                                  Text("${4.7} ", style: context.xDisplaySmall),
                                  PhosphorIcon(
                                    size: 16,
                                    PhosphorIcons.star(PhosphorIconsStyle.fill),
                                    color: content!.warning,
                                  ),
                                ],
                              ),
                              Text("التقييم", style: context.xLabelSmall),
                              SizedBox(height: 8.h(context)),
                              Container(
                                width: 90.w(context),
                                height: 1.h(context),
                                color: const Color(0xffE6E6E6),
                              ),
                              SizedBox(height: 8.h(context)),
                              Text("${10} ", style: context.xDisplaySmall),
                              Text("دورات", style: context.xLabelSmall),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.h(context)),
          SmoothPageIndicator(
            controller: _controller,
            count: _pageCount,
            effect: JumpingDotEffect(
              activeDotColor: bg.primaryBrand,
              dotColor: bg.primaryBrand.withOpacity(0.3),
              dotHeight: 9.h(context),
              dotWidth: 9.w(context),
              jumpScale: .9,
              verticalOffset: 25,
            ),
          ),
        ],
      ),
    );
  }
}
