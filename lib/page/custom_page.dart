import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransitionPage extends CustomTransitionPage {
  TransitionPage({
    super.key,
    required this.topChild,
  }) : super(
            child: topChild,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
                      opacity: animation,
                      child: child,
                    ));
  final Widget topChild;
}
