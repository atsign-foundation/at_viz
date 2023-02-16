import 'dart:async';
import 'dart:math';

import 'package:at_viz/at_charts/at_time_series_chart/lib/at_time_series_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeSeriesChartExample extends StatefulWidget {
  const TimeSeriesChartExample({super.key, required this.title});

  final String title;

  @override
  State<TimeSeriesChartExample> createState() => _TimeSeriesChartExampleState();
}

class _TimeSeriesChartExampleState extends State<TimeSeriesChartExample> {
  late AtTimeSeriesData lineData;
  late AtTimeSeriesData barData;

  late AtTimeSeriesStyle lineChartStyle;
  late AtTimeSeriesStyle barChartStyle;

  @override
  void initState() {
    super.initState();
    lineData = AtTimeSeriesData(
      timeCoordinate: [],
      numOfIntervals: 20,
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
      xLabelFormatter: (value, position) {
        if ((position % 5) == 0) {
          return DateFormat("hh:mm:ss").format(value.time);
        } else {
          return "";
        }
      },
      yLabelFormatter: (value) {
        return "${value.toInt()}℃";
      },
    );

    barData = AtTimeSeriesData(
      timeCoordinate: [],
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
      xLabelFormatter: (value, position) {
        return DateFormat("hh:mm:ss").format(value.time);
      },
      yLabelFormatter: (value) {
        return "${value.toInt()}℃";
      },
      drawMinorGridLine: false,
    );

    _initialSetup();
  }

  Timer? timer;
  void _initialSetup() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      lineData.insertSpot(
        coordinates:
            AtTimeCoordinate(DateTime.now(), Random().nextInt(30) + 20),
      );
      barData.insertSpot(
        coordinates:
            AtTimeCoordinate(DateTime.now(), Random().nextInt(30) + 20),
      );
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text("Temperature History"),
            ),
            AtTimeSeriesChart.line(
              data: lineData,
              style: lineChartStyle,
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text("Temperature History"),
            ),
            AtTimeSeriesChart.bar(
              data: barData,
              style: barChartStyle,
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
