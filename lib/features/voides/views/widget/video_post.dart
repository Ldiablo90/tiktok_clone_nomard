import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/common/widgets/video_config/video_config.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/voides/view_models/playback_config_vm.dart';
import 'package:tiktok_clone/features/voides/views/widget/video_button.dart';
import 'package:tiktok_clone/features/voides/views/widget/video_comments.dart';
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

  bool _isMuted = false;

  void _initVideoPlayer() async {
    _videoController =
        VideoPlayerController.asset("assets/videos/media_test.mp4");
    await _videoController.initialize();
    await _videoController.setLooping(true);
    if (kIsWeb) {
      await _videoController.setVolume(0);
    }

    _videoController.addListener(_onVideoChange);
    setState(() {});
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
    if (!mounted) return;
    if (info.visibleFraction == 1 &&
        !_isPaused &&
        !_videoController.value.isPlaying) {
      final autoplay = context.read<PlaybackConfigViewModel>().autoplay;
      if (autoplay) {
        _videoController.play();
      } else {
        _isPaused = !_isPaused;
      }
      setState(() {});
    }
    if (_videoController.value.isPlaying && info.visibleFraction == 0) {
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    print(_videoController.value.isPlaying);
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
      value: 1,
      duration: _aniDuration,
    );
    _onPlaybackConfigchanged();
    context
        .read<PlaybackConfigViewModel>()
        .addListener(_onPlaybackConfigchanged);
  }

  void setMuted() {
    _isMuted = !_isMuted;
    _videoController.setVolume(_isMuted ? 0 : 1);
    setState(() {});
  }

  void _onPlaybackConfigchanged() {
    print("_onPlaybackConfigchanged");
    if (!mounted) return;
    _isMuted = context.read<PlaybackConfigViewModel>().muted;
    _videoController.setVolume(_isMuted ? 0 : 1);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    // TODO: implement dispose
    _videoController.dispose();
    _animationController.dispose();
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
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              onPressed: () {
                setMuted();
              },
              icon: FaIcon(
                // VideoConfigData.of(context).autuMute
                _isMuted
                    ? FontAwesomeIcons.volumeOff
                    : FontAwesomeIcons.volumeHigh,
                color: Colors.white,
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
