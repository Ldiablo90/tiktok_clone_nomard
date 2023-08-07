import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class TutorialItem extends StatelessWidget {
  TutorialItem({
    super.key,
    required this.title,
    required this.content,
  });
  String title;
  String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.v80,
          Text(
            title,
            style: const TextStyle(
              fontSize: Sizes.size32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gaps.v16,
          Text(
            content,
            style: const TextStyle(
              fontSize: Sizes.size20,
            ),
          ),
        ],
      ),
    );
  }
}
