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

  Future<void> _initializePlayer() async {
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

    return WillPopScope(
      onWillPop: () async {
        if (_isFullScreen) {
          _toggleFullScreen();
          return false;
        }
        return true;
      },
      child: Scaffold(
        floatingActionButton:
            _isFullScreen ? null : const CourseWatchPageButtons(),
        backgroundColor: background.surfacePrimary,
        body: SafeArea(
          child: FutureBuilder(
            future: _initializePlayer(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(child: CircularProgressIndicator());
              }

              return YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller!,
                  showVideoProgressIndicator: false,
                  bottomActions: [
                    const Spacer(),
                    Center(
                      child: Container(
                        height: 40,
                        width:
                            MediaQuery.of(context).size.width - 40.w(context),
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
                                icon: const Icon(Icons.fullscreen,
                                    color: Colors.white),
                                onPressed: _toggleFullScreen,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                builder: (context, player) {
                  final styles = context;

                  return Padding(
                    padding: EdgeInsets.only(bottom: 78.h(context)),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: player,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w(context),
                                right: 20.w(context),
                                top: 16),
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
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
