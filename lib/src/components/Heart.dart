import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  bool isFav = false;

  Heart({Key? key, this.isFav = false}) : super(key: key);

  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late bool isFav = widget.isFav;

  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<double> _leftAnimation;

  void _intAnimation() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_controller);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 30), weight: 30),
    ]).animate(_controller);

    _leftAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1, end: 20), weight: 20),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 20, end: 1), weight: 1),
    ]).animate(_controller);

    if (isFav) {
      _controller.forward();
    }

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _intAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          return IconButton(
            icon: Icon(
              Icons.favorite,
              color: _colorAnimation.value,
              size: _sizeAnimation.value,
            ),
            onPressed: () {
              if (isFav) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
            },
          );
        });
  }
}
