import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _controller = TextEditingController();

  String _password = "";
  bool _obscureText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      _password = _controller.text;
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 7;
  }

  void _onNextTap() {
    if (_password.isNotEmpty && _isPasswordValid()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BirthdayScreen(),
        ),
      );
    }
  }

  void _onClearTap() {
    _controller.clear();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: _onScaffoldTap,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Sign up",
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v40,
                const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v8,
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: _obscureText,
                  autocorrect: false,
                  onEditingComplete: _onNextTap,
                  decoration: InputDecoration(
                    hintText: "Make it string!",
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _onClearTap,
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                            color: Colors.grey.shade400,
                            size: Sizes.size16,
                          ),
                        ),
                        Gaps.h10,
                        GestureDetector(
                          onTap: _toggleObscureText,
                          child: FaIcon(
                            _obscureText
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            size: Sizes.size16,
                          ),
                        ),
                      ],
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Gaps.v16,
                const Text("Your password must have:"),
                Gaps.v10,
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.circleCheck,
                      size: Sizes.size14,
                      color: _isPasswordValid() ? Colors.green : Colors.grey,
                    ),
                    Gaps.h5,
                    Text("8 to 20 characters"),
                  ],
                ),
                Gaps.v28,
                GestureDetector(
                  onTap: _onNextTap,
                  child: FormButtonWidget(
                      disabled: _password.isNotEmpty && _isPasswordValid()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
