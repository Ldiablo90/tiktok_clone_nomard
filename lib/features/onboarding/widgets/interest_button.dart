import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class InterestButton extends StatefulWidget {
  InterestButton({super.key, required this.text});
  String text;
  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;
  void _onTap() {
    _isSelected = !_isSelected;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
          horizontal: Sizes.size12,
        ),
        decoration: BoxDecoration(
            color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(
              Sizes.size32,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.3),
                blurRadius: 5,
              ),
            ]),
        child: Text(
          widget.text,
          style: TextStyle(
            color: _isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
