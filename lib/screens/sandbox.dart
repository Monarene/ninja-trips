import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  const SandBox({Key key}) : super(key: key);

  @override
  _SandBoxState createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  // static values
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.blue;

  // new values
  double _animatedMargin = 50;
  double _animatedOpacity = 0;
  double _animatedWidth = 400;
  Color _animatedColor = Colors.purple;

  // double isAnimated booleans
  bool _isAnimatedMargin;
  bool _isAnimatedOpacity;
  bool _isAnimatedWidth;
  bool _isAnimatedColor;

  @override
  void initState() {
    super.initState();
    _isAnimatedMargin = false;
    _isAnimatedOpacity = false;
    _isAnimatedWidth = false;
    _isAnimatedColor = false;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          margin: EdgeInsets.all(_isAnimatedMargin ? _animatedMargin : _margin),
          width: _isAnimatedWidth ? _animatedWidth : _width,
          color: _isAnimatedColor ? _animatedColor : _color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isAnimatedMargin = !_isAnimatedMargin;
                  });
                },
                child: Text("Animate Margin"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isAnimatedWidth = !_isAnimatedWidth;
                  });
                },
                child: Text("Animate Width"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isAnimatedColor = !_isAnimatedColor;
                  });
                },
                child: Text("Animate Color"),
              ),
              SizedBox(
                height: 20,
              ),ElevatedButton(
                onPressed: (){
                  setState((){
                    _isAnimatedOpacity = !_isAnimatedOpacity;
                  }); },
                child: Text("Animate Opacity"),
              ),
              SizedBox(
                height: 20,
              ),
              AnimatedOpacity(
                opacity: _isAnimatedOpacity ? _animatedOpacity : _opacity,
                duration: Duration(seconds: 2),
                child: Text("Hide Me", style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
