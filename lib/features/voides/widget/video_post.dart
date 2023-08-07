import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/voides/widget/video_button.dart';
import 'package:tiktok_clone/features/voides/widget/video_comments.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });
  final Function onVideoFinished;
  final int index;
  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _videoController;
  final _aniDuration = const Duration(milliseconds: 200);

  late final AnimationController _animationController;
  bool _isPaused = false;

  void _initVideoPlayer() async {
    _videoController =
        VideoPlayerController.asset("assets/videos/media_test.mp4");
    await _videoController.initialize();
    await _videoController.setLooping(true);
    if (kIsWeb) {
      await _videoController.setVolume(0);
    }
    setState(() {});
    _videoController.addListener(_onVideoChange);
  }

  void _onVideoChange() {
    if (_videoController.value.isInitialized) {
      if (_videoController.value.duration == _videoController.value.position) {
        // widget.onVideoFinished();
        // _videoController.seekTo(Duration.zero);
      }
    }
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    print("_onVisibilityChanged");
    if (info.visibleFraction == 1 && !_videoController.value.isPlaying) {
      print("_onVisibilityChanged : play");
      _videoController.play();
    }
  }

  void _onTogglePause() {
    if (_videoController.value.isPlaying) {
      _videoController.pause();
      _animationController.reverse();
      _isPaused = true;
    } else {
      _videoController.play();
      _animationController.forward();
      _isPaused = false;
    }
    setState(() {});
  }

  void _onCommentsTap() async {
    print("_onCommentsTap");
    _videoController.value.isPlaying ? _onTogglePause() : null;
    // context.push("/videotimelinescreen/comments");
    await showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const VideoComments();
      },
    );
    print("_onCommentsTap End");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initVideoPlayer();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1,
      upperBound: 1.5,
      value: 1.5,
      duration: _aniDuration,
    );
    print("intistate");
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    // TODO: implement dispose
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              child: _videoController.value.isInitialized
                  ? VideoPlayer(_videoController)
                  : Container(),
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: _isPaused ? 1 : 0,
                    duration: _aniDuration,
                    child: const FaIcon(
                      FontAwesomeIcons.play,
                      size: Sizes.size32,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 30,
            left: 30,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "@User Name",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  child: Text("니꼬"),
                ),
                Gaps.v24,
                VideoButton(
                  icon: FontAwesomeIcons.solidHeart,
                  text: "2.9M",
                ),
                Gaps.v24,
                GestureDetector(
                  onTap: _onCommentsTap,
                  // onTap: () => context.go("/videotimelinescreen/comments"),
                  child: VideoButton(
                    icon: FontAwesomeIcons.solidComment,
                    text: "33K",
                  ),
                ),
                Gaps.v24,
                VideoButton(
                  icon: FontAwesomeIcons.share,
                  text: "Share",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
