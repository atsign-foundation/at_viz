import 'dart:math';

import 'package:at_time_series_chart/at_time_series_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AtTimeSeriesData lineData;
  late AtTimeSeriesData barData;

  late AtTimeSeriesStyle lineChartStyle;
  late AtTimeSeriesStyle barChartStyle;

  setUp(() {
    lineData = AtTimeSeriesData(
      timeCoordinate: [
        AtTimeCoordinate(
          DateTime.now(),
          Random().nextInt(30) + 20,
        ),
        AtTimeCoordinate(
          DateTime(DateTime.now().second + 1),
          Random().nextInt(30) + 20,
        ),
      ],
      numOfIntervals: 6,
      intervalTimeInSeconds: 0.1,
      minY: 20,
      maxY: 50,
    );

    lineChartStyle = AtTimeSeriesStyle.line(
      drawYAxisTitle: true,
      lineWidth: 2,
      plotAreaMargin: const EdgeInsets.only(left: 50, bottom: 40, right: 20),
      chartSeriesColor: Colors.orange,
      xAxisTitle: const Text(
        "Time(s)",
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      ),
      yAxisTitle: const Text(
        "Temperature(℃)",
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      ),
      xAxisLabelStyle: const TextStyle(fontSize: 10, color: Colors.black),
      yAxisLabelStyle: const TextStyle(fontSize: 10, color: Colors.black),
      yLabelFormatter: (value) {
        return "${value.toInt()}℃";
      },
    );

    barData = AtTimeSeriesData(
      timeCoordinate: [
        AtTimeCoordinate(
          DateTime.now(),
          Random().nextInt(30) + 20,
        ),
        AtTimeCoordinate(
          DateTime(DateTime.now().second + 1),
          Random().nextInt(30) + 20,
        ),
      ],
      numOfIntervals: 8,
      intervalTimeInSeconds: 0.1,
      minY: 20,
      maxY: 50,
    );

    barChartStyle = AtTimeSeriesStyle.bar(
      drawYAxisTitle: true,
      columnWidth: 20,
      plotAreaMargin: const EdgeInsets.only(left: 50, bottom: 40, right: 20),
      chartSeriesColor: Colors.orange,
      xAxisTitle: const Text(
        "Time(s)",
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      ),
      yAxisTitle: const Text(
        "Temperature(℃)",
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      ),
      xAxisLabelStyle: const TextStyle(fontSize: 8, color: Colors.black),
      yAxisLabelStyle: const TextStyle(fontSize: 10, color: Colors.black),
      yLabelFormatter: (value) {
        return "${value.toInt()}℃";
      },
      drawMinorGridLine: true,
    );
  });

  testWidgets('Test AtTimeSeriesLineChart', (WidgetTester tester) async {
    final lineChart = AtTimeSeriesChart.line(
      data: lineData,
      style: lineChartStyle,
      backgroundColor: Colors.white,
    );

    Widget buildFrame() {
      return MaterialApp(
        home: Material(
          child: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: SafeArea(
                  child: Center(
                    child: lineChart,
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

    await tester.pumpWidget(
      buildFrame(),
    );

    await tester.pumpAndSettle();

    expect(find.byType(AtTimeSeriesChart), findsOneWidget);
    expect(lineChart.painter.data == lineData, true);
    expect(lineChart.backgroundColor == Colors.white, true);
  });

  testWidgets('Test AtTimeSeriesBarChart', (WidgetTester tester) async {
    final barChart = AtTimeSeriesChart.bar(
      data: barData,
      style: barChartStyle,
      backgroundColor: Colors.white,
    );

    Widget buildFrame() {
      return MaterialApp(
        home: Material(
          child: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: SafeArea(
                  child: Center(
                    child: barChart,
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

    await tester.pumpWidget(
      buildFrame(),
    );

    expect(find.byType(AtTimeSeriesChart), findsOneWidget);
    expect(barChart.painter.data == barData, true);
    expect(barChart.backgroundColor == Colors.white, true);
  });
}
