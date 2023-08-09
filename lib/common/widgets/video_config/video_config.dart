import 'package:flutter/widgets.dart';

// class VideoConfigData extends InheritedWidget {
//   VideoConfigData({
//     super.key,
//     required super.child,
//     required this.autuMute,
//     required this.toggleMute,
//   });
//   bool autuMute;
//   void Function() toggleMute;
//   static VideoConfigData of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<VideoConfigData>()!;
//   }

//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//     return true;
//   }
// }

// class VideoConfig extends StatefulWidget {
//   VideoConfig({super.key, required this.child});
//   Widget child;
//   @override
//   State<VideoConfig> createState() => _VideoConfigState();
// }

// class _VideoConfigState extends State<VideoConfig> {
//   bool autuMute = true;

//   void toggleMuted() {
//     autuMute = !autuMute;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return VideoConfigData(
//       child: widget.child,
//       autuMute: autuMute,
//       toggleMute: toggleMuted,
//     );
//   }
// }

class VideoConfig extends ChangeNotifier {
  bool isMute = false;
  bool isAutoplay = false;

  void toggleIsMuted() {
    isMute = !isMute;
    notifyListeners();
  }

  void toggleIsAutoplay() {
    isAutoplay = !isAutoplay;
    notifyListeners();
  }
}

final videoConfig = VideoConfig();


// Make ValueNotifier
// final videoConfig = ValueNotifier(false);
