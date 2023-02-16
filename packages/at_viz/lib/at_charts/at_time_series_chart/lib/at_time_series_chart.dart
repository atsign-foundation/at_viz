library at_time_series_chart;

import 'package:flutter/material.dart';

import 'bar_chart/at_time_series_bar_painter.dart';
import 'line_chart/at_time_series_line_painter.dart';
import 'utils/at_time_series_painter.dart';

part 'utils/at_time_series_data.dart';
part 'utils/at_time_series_style.dart';
part 'utils/at_time_coordinate.dart';

class AtTimeSeriesChart extends StatelessWidget {
  final AtTimeSeriesPainter painter;

  /// Set color to Chart
  final Color? backgroundColor;

  const AtTimeSeriesChart._({
    required this.painter,
    this.backgroundColor,
  });

  /// Paint a Bar Chart
  factory AtTimeSeriesChart.bar({
    AtTimeSeriesStyle? style,
    required AtTimeSeriesData data,
    Color? backgroundColor,
  }) {
    return AtTimeSeriesChart._(
      painter: AtTimeSeriesBarPainter(
        data: data,
        style: style ?? AtTimeSeriesStyle.bar(),
      ),
      backgroundColor: backgroundColor,
    );
  }

  /// Paint a Line Chart
  factory AtTimeSeriesChart.line({
    AtTimeSeriesStyle? style,
    required AtTimeSeriesData data,
    Color? backgroundColor,
  }) {
    return AtTimeSeriesChart._(
      painter: AtTimeSeriesLinePainter(
        data: data,
        style: style ?? AtTimeSeriesStyle.line(),
      ),
      backgroundColor: backgroundColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8),
      constraints: const BoxConstraints(
        minHeight: 200,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
      ),
      child: CustomPaint(
        painter: painter,
      ),
    );
  }
}
