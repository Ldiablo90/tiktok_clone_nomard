import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/voides/views/widget/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final _controller = PageController();
  final _scrollDuration = Duration(milliseconds: 200);
  final _scrollCurve = Curves.linear;
  final List<Color> colos = [
    Colors.black,
    Colors.red,
    Colors.brown,
    Colors.blue,
    Colors.yellow,
    Colors.grey,
  ];

  void _onPageChanged(int page) {
    _controller.animateToPage(page,
        duration: _scrollDuration, curve: _scrollCurve);
    setState(() {});
  }

  void _onVideoFinished() {
    return;
    // _controller.nextPage(duration: _scrollDuration, curve: _scrollCurve);
  }

  Future<void> _onRefresh() {
    return Future.delayed(const Duration(seconds: 3));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: PageView.builder(
          controller: _controller,
          onPageChanged: _onPageChanged,
          scrollDirection: Axis.vertical,
          itemCount: colos.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(color: colos[index]),
              child: Center(
                child:
                    VideoPost(onVideoFinished: _onVideoFinished, index: index),
              ),
            );
          },
        ),
      ),
    );
  }
}
// class VideoTimelineScreen extends StatefulWidget {
//   const VideoTimelineScreen({super.key});

//   @override
//   State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
// }

// class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Text("VideoTimelineScreen"),
//         ),
//       ),
//     );
//   }
// }
