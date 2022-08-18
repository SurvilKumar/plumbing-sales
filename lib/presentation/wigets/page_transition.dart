import 'package:flutter/material.dart';

class CustomPageRouteFade extends PageRouteBuilder {
  final Widget child;

  CustomPageRouteFade({
    required this.child,
  }) : super(
      transitionDuration: const Duration(milliseconds: 4000),
      reverseTransitionDuration: const Duration(milliseconds: 0),
      pageBuilder: (context, animation, secondaryAnimation) => child);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) =>
      FadeTransition(
          opacity: Tween<double>(begin: 0.3, end: 1).animate(animation),
          child: child);
}
