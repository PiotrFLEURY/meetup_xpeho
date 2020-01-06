import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meetup_xpeho/image_provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  _SplashPageState() {
    new Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushNamed("/team");
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            animatedLogo(),
            animatedTitle(),
          ],
        ),
      ),
    );
  }

  Widget animatedLogo() {
    final leftToRight = Tween<double>(begin: -500, end: 0).animate(controller);
    return AnimatedBuilder(
      animation: leftToRight,
      child: logo(),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(leftToRight.value, 0),
          child: child,
        );
      },
    );
  }

  Widget animatedTitle() {
    final rightToLeft = Tween<double>(begin: 500, end: 0).animate(controller);
    return AnimatedBuilder(
      animation: rightToLeft,
      child: Text(
        "meetup",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 32.0,
        ),
      ),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(rightToLeft.value, 0),
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
