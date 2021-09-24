import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

LineChartData mainData(List<FlSpot> points) {
  return LineChartData(
    borderData: FlBorderData(show: false),
    gridData: FlGridData(
      show: false,
    ),
    titlesData: FlTitlesData(
      leftTitles: SideTitles(showTitles: false),
      rightTitles: SideTitles(showTitles: false),
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 10,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff68737d),
          fontSize: 12,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 10:
              return 'Apr';
            case 60:
              return 'JUN';
            case 110:
              return 'Aug';
          }
          return '';
        },
        margin: 5,
      ),
    ),
    minX: 0,
    maxX: 120,
    minY: 0,
    maxY: 4,
    lineBarsData: [
      LineChartBarData(
        spots: points,
        isCurved: true,
        colors: [Colors.grey],
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: [Colors.grey].map((color) => color.withOpacity(0.5)).toList(),
        ),
      ),
    ],
  );
}
