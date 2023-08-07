import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onboarding/tutorial_screen.dart';
import 'package:tiktok_clone/features/onboarding/widgets/interest_button.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  static String routerName = "interests";
  static String routerURL = "/tutorial";

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final _scrollController = ScrollController();
  bool _showTitle = false;

  void _controllerEvent() {
    _scrollController.addListener(
      () {
        if (_scrollController.offset > 130) {
          if (_showTitle) return;
          _showTitle = true;
          setState(() {});
          return;
        }
        _showTitle = false;
        setState(() {});
      },
    );
  }

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TutorialScreen(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerEvent();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: AnimatedOpacity(
            opacity: _showTitle ? 1 : 0,
            duration: Duration(milliseconds: 300),
            child: const Text("Interests"),
          ),
        ),
        body: Scrollbar(
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Choese Your interests",
                    style: TextStyle(
                      fontSize: Sizes.size44,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gaps.v20,
                  const Text("Get better video recommendations"),
                  Gaps.v64,
                  Wrap(
                    runSpacing: Sizes.size20,
                    spacing: Sizes.size11,
                    children:
                        interests.map((e) => InterestButton(text: e)).toList(),
                  ),
                  Gaps.v16,
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: GestureDetector(
            onTap: _onNextTap,
            child: Padding(
              padding: const EdgeInsets.only(
                top: Sizes.size16,
                bottom: Sizes.size44,
                left: Sizes.size20,
                right: Sizes.size20,
              ),
              // child: CupertinoButton(
              //   onPressed: () {},
              //   color: Theme.of(context).primaryColor,
              //   child: Text("Next"),
              // ),
              child: Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size16,
                ),
                child: const Text(
                  "Next",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
