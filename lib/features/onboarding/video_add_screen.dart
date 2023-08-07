import 'package:flutter/material.dart';

class VideoAddScreen extends StatelessWidget {
  const VideoAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Text("VideoAddScreen"),
        ),
      ),
    );
  }
}
