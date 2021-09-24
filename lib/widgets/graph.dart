import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:Honeydu/widgets/graph_data.dart';

class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getPoints() {
    points = [];
    for (int i = 0; i <= 120; i += 10) {
      points.add(
        FlSpot(i.toDouble(),
            (Random().nextDouble() > 0.5) ? Random().nextDouble() * 4 : 2.0),
      );
    }
    return points;
  }

  List<FlSpot> points;
  bool check = false;
  @override
  Widget build(BuildContext context) {
    points = getPoints();
    Timer.periodic(Duration(seconds: 10), (timer) {
      if (mounted) {
        setState(() {});
      } else
        timer.cancel();
    });
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.45,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                mainData(points),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
