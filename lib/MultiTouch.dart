import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MultiTouch extends StatefulWidget {
  MultiTouch({Key? key}) : super(key: key);

  @override
  _MultiTouchState createState() => _MultiTouchState();
}

class _MultiTouchState extends State<MultiTouch> {
  int _touchCounter = 0;
  MultiTapGestureRecognizer threeDown = MultiTapGestureRecognizer();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        _touchCounter++;
        setState(() {});
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(_touchCounter.toString())],
        ),
      ),
    );
  }
}
