import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class FormButtonWidget extends StatelessWidget {
  FormButtonWidget({
    super.key,
    required this.disabled,
    this.text = "Next",
  });

  bool disabled;
  String text;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color:
              disabled ? Theme.of(context).primaryColor : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(
            Sizes.size3,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            color: disabled ? Colors.white : Colors.grey,
            fontWeight: FontWeight.w600,
          ),
          duration: const Duration(milliseconds: 150),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
