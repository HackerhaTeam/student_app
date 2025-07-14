import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/course_watch_page_buttons.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/intraction_button.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/pdf_files_viewer.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/video_player/video_controls_overlay.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/video_player/video_quality_option.dart';
import 'package:video_player/video_player.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';

//////////////////////////////////////////////
class CourseWatchPageBody extends StatefulWidget {
  final List<VideoQualityOption> qualityOptions;

  const CourseWatchPageBody({super.key, required this.qualityOptions});

  @override
  State<CourseWatchPageBody> createState() => _CourseWatchPageBodyState();
}

class _CourseWatchPageBodyState extends State<CourseWatchPageBody> {
  late VideoPlayerController _controller;
  int _currentQualityIndex = 0;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer({Duration? seekTo}) {
    _controller = VideoPlayerController.network(
      widget.qualityOptions[_currentQualityIndex].url,
    )..initialize().then((_) {
        if (seekTo != null) {
          _controller.seekTo(seekTo);
        }
        setState(() {});
      });
  }

  void _changeQuality(int index) async {
    final currentPosition = _controller.value.position;
    await _controller.pause();
    await _controller.dispose();

    setState(() {
      _currentQualityIndex = index;
    });

    _initializePlayer(seekTo: currentPosition);
  }

  void _toggleFullScreen() {
    if (_isFullScreen) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      });
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }

    setState(() {
      _isFullScreen = !_isFullScreen;
    });
  }

  // void _toggleFullScreen() {
  //   if (_isFullScreen) {
  //     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  //     SystemChrome.setPreferredOrientations([
  //       DeviceOrientation.portraitUp,
  //     ]);
  //   } else {
  //     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  //     SystemChrome.setPreferredOrientations([
  //       DeviceOrientation.landscapeLeft,
  //       DeviceOrientation.landscapeRight,
  //     ]);
  //   }

  //   setState(() {
  //     _isFullScreen = !_isFullScreen;
  //   });
  // }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  void _showQualityMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black.withOpacity(0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      builder: (_) => ListView.builder(
        itemCount: widget.qualityOptions.length,
        itemBuilder: (ctx, index) {
          final option = widget.qualityOptions[index];
          return ListTile(
            title:
                Text(option.label, style: const TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
              _changeQuality(index);
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    final styles = context;
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
        backgroundColor: background.onSurfacePrimary,
        body: _controller.value.isInitialized
            ? (_isFullScreen
                ? Stack(
                    children: [
                      Positioned.fill(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: _controller.value.size.width,
                            height: _controller.value.size.height,
                            child: VideoPlayer(_controller),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: VideoControlsOverlay(
                          controller: _controller,
                          onSelectQuality: _showQualityMenu,
                          onExitFullScreen: _toggleFullScreen,
                        ),
                      ),
                    ],
                  )
                : SafeArea(
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Stack(
                            children: [
                              VideoPlayer(_controller),
                              VideoControlsOverlay(
                                controller: _controller,
                                onSelectQuality: _showQualityMenu,
                                onExitFullScreen: _toggleFullScreen,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "التعامل مع الحلقات التكرارية في ++C",
                                style: context.xHeadingLarge,
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
                                style: context.xHeadingLarge,
                              ),
                              const SizedBox(height: 16),
                              const PdfFilesViewer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}


/////////////////////////////////////////////////////////////////////




/**
 * 
 * import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/video_player/video_controls_overlay.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/video_player/video_quality_option.dart';
import 'package:video_player/video_player.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';

class CourseWatchPageBody extends StatefulWidget {
  final List<VideoQualityOption> qualityOptions;

  const CourseWatchPageBody({super.key, required this.qualityOptions});

  @override
  State<CourseWatchPageBody> createState() => _CourseWatchPageBodyState();
}

class _CourseWatchPageBodyState extends State<CourseWatchPageBody> {
  late VideoPlayerController _controller;
  int _currentQualityIndex = 0;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer({Duration? seekTo}) {
    _controller = VideoPlayerController.network(
      widget.qualityOptions[_currentQualityIndex].url,
    )..initialize().then((_) {
        if (seekTo != null) {
          _controller.seekTo(seekTo);
        }
        setState(() {});
        _controller.play();
      });
  }

  void _changeQuality(int index) async {
    final currentPosition = _controller.value.position;
    await _controller.pause();
    await _controller.dispose();

    setState(() {
      _currentQualityIndex = index;
    });

    _initializePlayer(seekTo: currentPosition);
  }

  void _toggleFullScreen() {
    if (_isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }

    setState(() {
      _isFullScreen = !_isFullScreen;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  void _showQualityMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black.withOpacity(0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      builder: (_) => ListView.builder(
        itemCount: widget.qualityOptions.length,
        itemBuilder: (ctx, index) {
          final option = widget.qualityOptions[index];
          return ListTile(
            title:
                Text(option.label, style: const TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
              _changeQuality(index);
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.black,
        body: _controller.value.isInitialized
            ? Stack(
                children: [
                  Positioned.fill(
                    child: _isFullScreen
                        ? SizedBox.expand(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: SizedBox(
                                width: _controller.value.size.width,
                                height: _controller.value.size.height,
                                child: VideoPlayer(_controller),
                              ),
                            ),
                          )
                        : Center(
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                          ),
                  ),
                  Positioned.fill(
                    child: VideoControlsOverlay(
                      controller: _controller,
                      onSelectQuality: _showQualityMenu,
                      onExitFullScreen: _toggleFullScreen,
                    ),
                  ),
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}   شوف عندي هي الصفحة بدي مشغل الفيديو كامل هو وشريط التشغيل تبعو وهيك يكون محطوط ب column  والمشغل بقلب   AspectRatio(
                        aspectRatio: 16 / 9,   مشان احط كمالة الصفحة تحتو طبعا هالحكي وقت بكونن  _isFullScreen =false
 * 
 * 
 * 
 * 
 * 
 */