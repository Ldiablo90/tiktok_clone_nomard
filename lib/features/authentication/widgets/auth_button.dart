import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

// ignore: must_be_immutable
class AuthButtonWidget extends StatelessWidget {
  AuthButtonWidget({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  String text;
  FaIcon icon;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: Sizes.size1,
              color: Colors.grey.shade300,
            ),
          ),
          padding: const EdgeInsets.all(Sizes.size14),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: icon,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
