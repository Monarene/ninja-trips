import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin{
  bool isFav = false;
  AnimationController _controller;
  Animation<Color> _colorAnimation;

  @override
  void initState() {
    super.initState();
    initializeVariables();
    activateStatusListeners();
  }

  void initializeVariables() {
    _controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this );
    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red).animate(_controller);
  }

  void activateStatusListeners() {
    _controller.addListener(() {
    });

    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        changeFavStatetoTrue();
      } if(status == AnimationStatus.dismissed) {
        changeFavStatusToFalse();
      }
    });
  }

  void changeFavStatetoTrue() {
    setState(() {
      isFav = true;
    });
  }

  void changeFavStatusToFalse() {
    setState(() {
      isFav = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
            size: 30,
          ),
          onPressed: () {
            isFav ? _controller.reverse() : _controller.forward();
          },
        );
      },
    );
  }
}
