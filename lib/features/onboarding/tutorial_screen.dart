import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onboarding/widgets/tutorial_item.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    _direction = details.delta.dx > 0 ? Direction.right : Direction.left;
    setState(() {});
  }

  void _onPanEnd(DragEndDetails details) {
    _showingPage = _direction == Direction.left ? Page.second : Page.first;
    setState(() {});
  }

  void _onEndTap() {
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: SafeArea(
        child: Scaffold(
          body: AnimatedCrossFade(
            firstChild: Column(
              children: [
                TutorialItem(
                    title: "Whtch cool videos!",
                    content:
                        "Videos are personalized for you based on what you watch, like, and share."),
              ],
            ),
            secondChild: Column(
              children: [
                TutorialItem(
                    title: "Follow the rules!",
                    content:
                        "Videos are personalized for you based on what you watch, like, and share."),
              ],
            ),
            crossFadeState: _showingPage == Page.first
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: _showingPage == Page.first ? 0 : Sizes.size16,
                horizontal: Sizes.size48,
              ),
              child: AnimatedOpacity(
                opacity: _showingPage == Page.first ? 0 : 1,
                duration: const Duration(milliseconds: 150),
                child: CupertinoButton(
                  onPressed: () => _onEndTap(),
                  color: Theme.of(context).primaryColor,
                  child: Text("Enter the app!"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    //   return DefaultTabController(
    //     length: 3,
    //     child: SafeArea(
    //       child: Scaffold(
    //         appBar: AppBar(),
    //         body: TabBarView(
    //           children: [
    //             TutorialItem(
    //                 title: "Whtch cool videos!",
    //                 content:
    //                     "Videos are personalized for you based on what you watch, like, and share."),
    //             TutorialItem(
    //                 title: "Follow the rules!",
    //                 content:
    //                     "Videos are personalized for you based on what you watch, like, and share."),
    //             TutorialItem(
    //                 title: "Enjoy the ride",
    //                 content:
    //                     "Videos are personalized for you based on what you watch, like, and share."),
    //           ],
    //         ),
    //         bottomNavigationBar: BottomAppBar(
    //           child: Container(
    //             padding: const EdgeInsets.symmetric(
    //               vertical: Sizes.size36,
    //             ),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 TabPageSelector(
    //                   selectedColor: Colors.black,
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
  }
}
