import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  Animation animation;
  AnimationController animationController;


  @override
  void initState() {          //the juice initialization can be done anywhere not necessarily initState
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 4),vsync: this);

    animation = Tween(begin: -1, end: 0.0).animate(
      CurvedAnimation(parent: animationController,
          curve: Curves.elasticInOut
      )
    );

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            backgroundColor: Colors.pinkAccent,
            body: Transform(
              transform: Matrix4.translationValues(animation.value*width, 0, 0),    //the juice implementation
              child: Center(
                child: Text('EKISAJJA',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
                ),
              ),
            ),
          );
        }
    );
  }
}

