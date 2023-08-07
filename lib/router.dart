import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/features/userprofile/user_profile_screen.dart';
import 'package:tiktok_clone/features/voides/video_recording_screen.dart';
import 'package:tiktok_clone/page/dialog_page.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/login_form_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/password_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/inbox.dart/activity_screen.dart';
import 'package:tiktok_clone/features/inbox.dart/chat_detail_screen.dart';
import 'package:tiktok_clone/features/inbox.dart/chats_screen.dart';
import 'package:tiktok_clone/features/inbox.dart/inbox_screen.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';
import 'package:tiktok_clone/features/onboarding/tutorial_screen.dart';
import 'package:tiktok_clone/features/onboarding/video_add_screen.dart';
import 'package:tiktok_clone/features/voides/video_timeline_screen.dart';
import 'package:tiktok_clone/features/voides/widget/video_comments.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/inbox',
  routes: <RouteBase>[
    GoRoute(
      name: SignUpScreen.routerName,
      path: SignUpScreen.routerURL,
      builder: (context, state) {
        // return VideoRecordingScreen();
        return SignUpScreen();
      },
    ),
    GoRoute(
      name: LoginScreen.routerName,
      path: LoginScreen.routerURL,
      builder: (context, state) {
        return LoginScreen();
      },
    ),
    GoRoute(
      name: InterestsScreen.routerName,
      path: InterestsScreen.routerURL,
      builder: (context, state) {
        return InterestsScreen();
      },
    ),
    GoRoute(
      name: MainNavigationScreen.routerName,
      path: "/:tab(home|discover|inbox|profile)",
      builder: (context, state) {
        final tab = state.pathParameters["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
    ),
    GoRoute(
      name: ActivityScreen.routerName,
      path: ActivityScreen.routerURL,
      builder: (context, state) {
        return ActivityScreen();
      },
    ),
    GoRoute(
      name: ChatsScreen.routerName,
      path: ChatsScreen.routerURL,
      builder: (context, state) {
        return ChatsScreen();
      },
      routes: [
        GoRoute(
          name: chatDetailScreen.routerName,
          path: chatDetailScreen.routerURL,
          builder: (context, state) {
            final chatId = state.pathParameters["chatId"]!;
            return chatDetailScreen(chatId: chatId);
          },
        ),
      ],
    ),
    GoRoute(
      name: VideoRecordingScreen.routerName,
      path: VideoRecordingScreen.routerURL,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
            transitionDuration: Duration(milliseconds: 200),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final position = Tween(
                begin: Offset(0, 1),
                end: Offset.zero,
              ).animate(animation);
              return SlideTransition(
                position: position,
                child: child,
              );
            },
            child: VideoRecordingScreen());
      },
    ),
    // GoRoute(
    //   path: "/usernamescreen",
    //   builder: (context, state) {
    //     return UsernameScreen();
    //   },
    // ),
    // GoRoute(
    //   path: "/passwordscreen",
    //   builder: (context, state) {
    //     return PasswordScreen();
    //   },
    // ),
    // GoRoute(
    //   path: "/birthdayscreen",
    //   builder: (context, state) {
    //     return BirthdayScreen();
    //   },
    // ),
    // GoRoute(
    //   path: "/loginformscreen",
    //   builder: (context, state) {
    //     return LoginFormScreen();
    //   },
    // ),
    // GoRoute(
    //   path: "/interestsscreen",
    //   builder: (context, state) {
    //     return InterestsScreen();
    //   },
    // ),
    // GoRoute(
    //   path: "/tutorialscreen",
    //   builder: (context, state) {
    //     return TutorialScreen();
    //   },
    // ),
    // ShellRoute(
    //   navigatorKey: _shellNavigatorKey,
    //   builder: (context, state, child) {
    //     return MainNavigationScreen(
    //       key: state.pageKey,
    //       child: child,
    //     );
    //   },
    //   routes: <RouteBase>[
    //     GoRoute(
    //       path: "/discoverscreen",
    //       builder: (context, state) {
    //         return DiscoverScreen();
    //       },
    //     ),
    //     GoRoute(
    //       path: "/videotimelinescreen",
    //       builder: (context, state) {
    //         return VideoTimelineScreen();
    //       },
    //       routes: [
    //         GoRoute(
    //           path: "comments",
    //           pageBuilder: (context, state) {
    //             return DialogPage(
    //               builder: (_) => VideoComments(),
    //             );
    //           },
    //         ),
    //       ],
    //     ),
    //     GoRoute(
    //       path: "/videoaddscreen",
    //       builder: (context, state) {
    //         return VideoAddScreen();
    //       },
    //     ),
    //     GoRoute(
    //       path: "/inboxscreen",
    //       builder: (context, state) {
    //         return InBoxScreen();
    //       },
    //       routes: [
    //         GoRoute(
    //           path: "activityscreen",
    //           builder: (context, state) {
    //             return ActivityScreen();
    //           },
    //         ),
    //         GoRoute(
    //           path: "chatsscreen",
    //           builder: (context, state) {
    //             return ChatsScreen();
    //           },
    //           routes: [
    //             GoRoute(
    //               name: "chatdetial",
    //               path: "detail",
    //               // pageBuilder: (context, state) {
    //               //   return OuterPage(
    //               //     builder: (_) => chatDetailScreen(),
    //               //   );
    //               // },
    //               builder: (context, state) {
    //                 return chatDetailScreen();
    //               },
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     GoRoute(
    //       path: "/userprofile",
    //       builder: (context, state) {
    //         return UserProfileScreen();
    //       },
    //       routes: [
    //         GoRoute(
    //           name: "settings",
    //           path: "settings",
    //           builder: (context, state) {
    //             return SettingsScreen();
    //           },
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
  ],
);
