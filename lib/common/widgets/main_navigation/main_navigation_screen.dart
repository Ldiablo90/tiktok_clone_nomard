import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/inbox.dart/inbox_screen.dart';
import 'package:tiktok_clone/common/widgets/main_navigation/widgets/main_navigation_destination.dart';
import 'package:tiktok_clone/features/onboarding/hoem_screen.dart';
import 'package:tiktok_clone/features/onboarding/search_screen.dart';
import 'package:tiktok_clone/features/userprofile/user_profile_screen.dart';
import 'package:tiktok_clone/features/onboarding/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/voides/views/video_recording_screen.dart';
import 'package:tiktok_clone/features/voides/views/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  MainNavigationScreen({
    super.key,
    required this.tab,
    this.child,
  });
  static String routerName = "mainNavigation";
  final String tab;
  final Widget? child;
  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  List<MainNavigationBarItem> tabs = [];

  final List<String> _tabsString = [
    "home",
    "discover",
    "xxxx",
    "inbox",
    "profile",
  ];

  late int _currentIndex = _tabsString.indexOf(widget.tab);

  Future<void> _addVideoTap() async {}

  void _onItemTap({required int index}) {
    if (index == 2) {
      context.pushNamed(VideoRecordingScreen.routerName);
    } else {
      if (index != _currentIndex) {
        _currentIndex = index;
        _initStateData();

        context.go("/${_tabsString[_currentIndex]}");
        setState(() {});
      }
    }
  }

  void _initStateData() {
    if (_currentIndex == -1) {
      _currentIndex = 1;
    }
    tabs = [
      MainNavigationBarItem(
        icons: FontAwesomeIcons.house,
        selectIcons: FontAwesomeIcons.house,
        labeld: "Home",
        initaLocation: "/videotimelinescreen",
        selectedIndex: _currentIndex,
        selected: _currentIndex == 0,
      ),
      MainNavigationBarItem(
        icons: FontAwesomeIcons.compass,
        selectIcons: FontAwesomeIcons.solidCompass,
        labeld: "Discover",
        initaLocation: "/discoverscreen",
        selectedIndex: _currentIndex,
        selected: _currentIndex == 1,
      ),
      MainNavigationBarItem(
        icons: FontAwesomeIcons.message,
        selectIcons: FontAwesomeIcons.solidMessage,
        labeld: VideoRecordingScreen.routerName,
        initaLocation: VideoRecordingScreen.routerName,
        selectedIndex: _currentIndex,
        onTap: true,
      ),
      MainNavigationBarItem(
        icons: FontAwesomeIcons.message,
        selectIcons: FontAwesomeIcons.solidMessage,
        labeld: "Inbox",
        initaLocation: "/inboxscreen",
        selectedIndex: _currentIndex,
        selected: _currentIndex == 3,
      ),
      MainNavigationBarItem(
        icons: FontAwesomeIcons.user,
        selectIcons: FontAwesomeIcons.solidUser,
        labeld: "Profile",
        initaLocation: "/userprofile",
        selectedIndex: _currentIndex,
        selected: _currentIndex == 4,
      ),
    ];
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initStateData();
  }

  Future<bool> _onWillPopTab() async {
    if (context.canPop()) {}
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPopTab,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Offstage(
              offstage: _currentIndex != 0,
              child: VideoTimelineScreen(),
            ),
            Offstage(
              offstage: _currentIndex != 1,
              child: DiscoverScreen(),
            ),
            Offstage(
              offstage: _currentIndex != 3,
              child: InBoxScreen(),
            ),
            Offstage(
              offstage: _currentIndex != 4,
              child: UserProfileScreen(),
            ),
          ],
        ),
        // body: widget.child,
        bottomNavigationBar: NavigationBar(
          backgroundColor: _currentIndex == 0 ? Colors.black : Colors.white,
          indicatorColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 1500),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) => _onItemTap(index: index),
          destinations: tabs,
        ),
      ),
    );
  }
}
