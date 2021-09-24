import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiPage extends StatefulWidget {
  const ConfettiPage({Key key, this.route, this.revert = false})
      : super(key: key);
  final Widget route;
  final bool revert;

  @override
  _ConfettiPageState createState() => _ConfettiPageState();
}

class _ConfettiPageState extends State<ConfettiPage> {
  ConfettiController controller;

  @override
  void initState() {
    super.initState();
    controller =
        ConfettiController(duration: const Duration(milliseconds: 500));
    controller.play();
    Future.delayed(
      Duration(seconds: 5),
      () => !widget.revert
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => widget.route),
            )
          : Navigator.pop(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        buildConfettiWidget(controller, pi / 1, Alignment.topLeft),
        buildConfettiWidget(controller, pi / 2, Alignment.topCenter),
        buildConfettiWidget(controller, pi / 4, Alignment.topRight),
        Align(
          alignment: Alignment.center,
          child: Center(
            child: Image.asset(
              'assets/images/welcome.png',
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ),
        ),
        // buildButton()
      ],
    ));
  }

  Align buildConfettiWidget(controller, double blastDirection, alignment) {
    return Align(
      alignment: alignment,
      child: ConfettiWidget(
        confettiController: controller,
        shouldLoop: false,
        blastDirection: blastDirection,
        colors: [...Colors.primaries],
        maxBlastForce: 50.0,
        minBlastForce: 10.0,
        numberOfParticles: 50,
        blastDirectionality: BlastDirectionality.explosive,
        emissionFrequency: 0.02,
        gravity: 0.05,
      ),
    );
  }

  Align buildButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: ElevatedButton(
          onPressed: () {
            controller.play();
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.red),
            textStyle: MaterialStateProperty.all(
              TextStyle(color: Colors.white),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Congratulations!",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
