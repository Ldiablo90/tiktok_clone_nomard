import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok_clone/common/widgets/video_config/video_config.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/voides/models/playback_config_model.dart';
import 'package:tiktok_clone/features/voides/repos/video_playback_config_repo.dart';
import 'package:tiktok_clone/features/voides/view_models/playback_config_vm.dart';
import 'package:tiktok_clone/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  final preferences = await SharedPreferences.getInstance();

  final repository = VideoPlaybackConfigRepository(preferences);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlaybackConfigViewModel(repository),
        ),
      ],
      child: const TikTokCloneApp(),
    ),
  );
}

class TikTokCloneApp extends StatelessWidget {
  const TikTokCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TikTok Clone',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        navigationBarTheme: NavigationBarThemeData(
          // backgroundColor: Colors.black,
          // indicatorColor: Colors.white,
          labelTextStyle: MaterialStateProperty.resolveWith(((states) {
            if (states.isNotEmpty) {
              return TextStyle(color: Colors.white);
            } else {
              return TextStyle(color: Colors.grey.withOpacity(.8));
            }
          })),
        ),
        primaryColor: const Color(0xFFE9435A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   scaffoldBackgroundColor: Colors.black,
      // ),
      routerConfig: routerProvider,
    );
  }
}
