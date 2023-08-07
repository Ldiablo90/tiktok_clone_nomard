import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String routerName = "signUp";
  static String routerURL = "/";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  void _onLoginTap() async {
    final result = await context.pushNamed(LoginScreen.routerName);
    print(result);
  }

  void _onEmailTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UsernameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
              child: Column(
                children: [
                  Gaps.v80,
                  const Text(
                    "Sign up for TikTok",
                    style: TextStyle(
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.v20,
                  const Text(
                    "Create a profile, follow other accounts, make your own videos, and more.",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.black45,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gaps.v40,
                  AuthButtonWidget(
                    text: "Use phone or emails",
                    icon: const FaIcon(
                      FontAwesomeIcons.user,
                    ),
                    onTap: _onEmailTap,
                  ),
                  Gaps.v10,
                  AuthButtonWidget(
                    text: "Continue with Apple",
                    icon: const FaIcon(
                      FontAwesomeIcons.apple,
                    ),
                  ),
                  Gaps.v10,
                  // AuthButtonWidget(
                  //     text: "Continue with Facebook",
                  //     icon: const FaIcon(
                  //       FontAwesomeIcons.facebook,
                  //     )),
                  // Gaps.v10,
                  // AuthButtonWidget(
                  //     text: "Continue with Apple",
                  //     icon: const FaIcon(
                  //       FontAwesomeIcons.apple,
                  //     )),
                  // Gaps.v10,
                  // AuthButtonWidget(
                  //     text: "Continue with Google",
                  //     icon: const FaIcon(
                  //       FontAwesomeIcons.google,
                  //     )),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 2,
            color: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size32,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  Gaps.h5,
                  GestureDetector(
                    onTap: _onLoginTap,
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
