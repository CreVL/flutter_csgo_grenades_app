import 'package:csgo_grenades/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String videoUrl;
  final Offset offset;

  const VideoScreen({Key? key, required this.videoUrl, required this.offset})
      : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;
  double _currentSliderValue = 0.0;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );

    _controller.addListener(() {
      setState(() {
        _currentSliderValue = _controller.value.position.inSeconds.toDouble();
      });

      if (_controller.value.position >= _controller.value.duration) {
        _controller.seekTo(Duration.zero);
        _controller.play();
      }
    });

    _controller.initialize().then((_) {
      setState(() {
        _isVideoInitialized = true;
      });
      _controller.play();
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_onVideoControllerUpdate);
    _controller.dispose();
    super.dispose();
  }

  void _onVideoControllerUpdate() {
    if (_controller.value.position >= _controller.value.duration) {
      _controller.seekTo(Duration.zero);
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_isFullScreen) {
          _exitFullScreen();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Throw"),
        ),
        body: Center(
          child: _isVideoInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        VideoPlayer(_controller),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FloatingActionButton(
                                    splashColor: AppColors.blackColor,
                                    mini: true,
                                    onPressed: () {
                                      setState(() {
                                        if (_controller.value.isPlaying) {
                                          _controller.pause();
                                        } else {
                                          _controller.play();
                                        }
                                      });
                                    },
                                    child: Icon(
                                      _controller.value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    focusColor: AppColors.blackColor,
                                    splashColor: AppColors.blackColor,
                                    mini: true,
                                    onPressed: () {
                                      setState(() {
                                        if (_isFullScreen) {
                                          _exitFullScreen();
                                        } else {
                                          _enterFullScreen();
                                        }
                                      });
                                    },
                                    child: Icon(
                                      _isFullScreen
                                          ? Icons.fullscreen_exit
                                          : Icons.fullscreen,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  )
                                ],
                              ),
                              Slider(
                                inactiveColor: AppColors.blackColor,
                                value: _currentSliderValue,
                                min: 0.0,
                                max: _controller.value.duration.inSeconds
                                    .toDouble(),
                                onChanged: (value) {
                                  setState(() {
                                    _currentSliderValue = value;
                                    _controller.seekTo(
                                        Duration(seconds: value.toInt()));
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }

  void _enterFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    setState(() {
      _isFullScreen = true;
    });
  }

  void _exitFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    setState(() {
      _isFullScreen = false;
    });
  }
}
