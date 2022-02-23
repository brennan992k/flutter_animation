import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        curve: Curves.ease,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(seconds: 1),
        builder: (BuildContext context, double _val, child) {
          return Opacity(
              opacity: _val,
              child: Padding(
                padding: EdgeInsets.only(top: _val * 20),
                child: child,
              ));
        });
  }
}
