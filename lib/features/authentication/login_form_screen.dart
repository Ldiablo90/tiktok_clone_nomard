import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> _formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        print(_formData);
        context.goNamed(InterestsScreen.routerName);
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Log in"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: Sizes.size14)),
                  validator: (value) {
                    return null;
                    // return "i dont like your email";
                  },
                  onSaved: (newValue) {
                    print(newValue);
                    _formData['email'] = newValue ?? '';
                  },
                ),
                Gaps.v16,
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(fontSize: Sizes.size14),
                  ),
                  validator: (value) {
                    return null;
                    // return "wrong password";
                  },
                  onSaved: (newValue) {
                    _formData['password'] = newValue ?? '';
                  },
                ),
                Gaps.v28,
                GestureDetector(
                  onTap: () => _onSubmitTap(),
                  child: FormButtonWidget(
                    disabled: true,
                    text: "Log in",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
