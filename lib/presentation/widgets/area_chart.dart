import 'dart:math';

import 'package:atmos_app/presentation/resources/app_resources.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  final double actualValue;
  const LineChartSample2({super.key, required this.actualValue});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  double get actualValue => widget.actualValue;
  List<Color> gradientColors = [
    AppColors.contentColorWhite,
    AppColors.contentColorGreen,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 2.2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: LineChart(mainData()),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    String text = switch (value.toInt()) {
      0 => '8',
      1 => '7',
      2 => '6',
      3 => '5',
      4 => '4',
      5 => '3',
      6 => '2',
      7 => '1',
      8 => 'NOW',
      _ => '',
    };
    return SideTitleWidget(
      meta: meta,
      child: Text(text, style: style),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.mainGridLineColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColors.mainGridLineColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 8,
      minY: 0,
      maxY: actualValue,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, Random().nextInt(actualValue.toInt() - 1).toDouble()),
            FlSpot(1, Random().nextInt(actualValue.toInt() - 1).toDouble()),
            FlSpot(2, Random().nextInt(actualValue.toInt() - 1).toDouble()),
            FlSpot(3, Random().nextInt(actualValue.toInt() - 1).toDouble()),
            FlSpot(4, Random().nextInt(actualValue.toInt() - 1).toDouble()),
            FlSpot(5, Random().nextInt(actualValue.toInt() - 1).toDouble()),
            FlSpot(6, Random().nextInt(actualValue.toInt() - 1).toDouble()),
            FlSpot(7, Random().nextInt(actualValue.toInt() - 1).toDouble()),
            FlSpot(8, actualValue.toDouble()),
          ],
          isCurved: true,
          gradient: LinearGradient(colors: gradientColors),
          barWidth: 2,
          isStrokeCapRound: false,
          dotData: const FlDotData(show: true),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withValues(alpha: 0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
