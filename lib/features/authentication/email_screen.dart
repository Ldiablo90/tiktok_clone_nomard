import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/password_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  EmailScreen({super.key, required this.username});
  final String username;
  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _controller = TextEditingController();

  String _email = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      _email = _controller.text;
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  String? _isEmailValid() {
    if (_email.isEmpty) return null;
    final regExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return "Email not valid";
    }
    return null;
  }

  void _onNextTap() {
    if (_email.isNotEmpty && _isEmailValid() == null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PasswordScreen(),
        ),
      );
    }
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
                Text(
                  "What is your email? ${widget.username}",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v8,
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  onEditingComplete: _onNextTap,
                  decoration: InputDecoration(
                    hintText: "Email",
                    errorText: _isEmailValid(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Gaps.v28,
                GestureDetector(
                  onTap: _onNextTap,
                  child: FormButtonWidget(
                      disabled: _email.isNotEmpty && _isEmailValid() == null),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
