import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const TikTokCloneApp());
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
