import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/course_watch_page_buttons.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/intraction_button.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/pdf_files_viewer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseWatchPageBody extends StatefulWidget {
  final String youtubeUrl;

  const CourseWatchPageBody({super.key, required this.youtubeUrl});

  @override
  State<CourseWatchPageBody> createState() => _CourseWatchPageBodyState();
}

class _CourseWatchPageBodyState extends State<CourseWatchPageBody> {
  YoutubePlayerController? _controller;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer() {
    final videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl);
    if (videoId == null) {
      throw Exception("Invalid YouTube URL");
    }

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: true,
      ),
    );
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });
    _controller?.toggleFullScreenMode();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    final styles = context;

    if (_controller == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return WillPopScope(
      onWillPop: () async {
        if (_isFullScreen) {
          _toggleFullScreen();
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: background.surfacePrimary,
        floatingActionButton:
            _isFullScreen ? null : const CourseWatchPageButtons(),
        body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller!,
            showVideoProgressIndicator: false,
            bottomActions: [
              Expanded(
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 40.w(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(72.r(context)),
                    color: background.onSurfaceTransparent,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        CurrentPosition(),
                        const SizedBox(width: 8),
                        ProgressBar(
                          isExpanded: true,
                          colors: ProgressBarColors(
                            playedColor: content.brandPrimary,
                            handleColor: content.brandPrimary,
                            backgroundColor: background.containerStatic,
                          ),
                        ),
                        const SizedBox(width: 8),
                        RemainingDuration(),
                        IconButton(
                          icon:
                              const Icon(Icons.fullscreen, color: Colors.white),
                          onPressed: _toggleFullScreen,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          builder: (context, player) {
            // Fullscreen Mode: only show the video
            if (_isFullScreen) {
              return Scaffold(
                backgroundColor: Colors.black,
                body: Center(child: player),
              );
            }

            // Normal Mode
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 78.h(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: player,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w(context),
                          vertical: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "التعامل مع الحلقات التكرارية في ++C",
                              style: styles.xHeadingLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "أ. محمد المحمد",
                              style: styles.xLabelMedium.copyWith(
                                color: content.secondary,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IntractionButton(
                                  icon: PhosphorIcons.thumbsUp(),
                                  text: "11 ألف",
                                ),
                                SizedBox(width: 8.w(context)),
                                IntractionButton(
                                  icon: PhosphorIcons.thumbsDown(),
                                ),
                                const Spacer(),
                                IntractionButton(
                                  icon: PhosphorIcons.bookmarkSimple(),
                                  text: "حفظ",
                                ),
                                SizedBox(width: 8.w(context)),
                                IntractionButton(
                                  icon: PhosphorIcons.downloadSimple(),
                                  text: "تنزيل",
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "ملاحظات",
                              style: styles.xHeadingSmall,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "هذا الفديو له ملاحظة ما يود الأستاذ بشكل اختياري كتابتها، فيتم عرضها هنا، وإن لم يكتب الأستاذ أي ملاحظة لن يظهر هنا قسم الملاحظات أبداً.",
                              style: styles.xParagraphMedium,
                            ),
                            SizedBox(height: 16.h(context)),
                            Text(
                              "الملفات المرفقة",
                              style: styles.xHeadingLarge,
                            ),
                            const SizedBox(height: 16),
                            const PdfFilesViewer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
