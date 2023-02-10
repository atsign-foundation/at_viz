
import 'dart:math';

import 'package:flutter/material.dart';

import '../at_time_series_chart.dart';

/// Default value of GridLines width
const double _gridLineWidth = 0.2;

/// Default textStyle for ChartLabel and ChartTitle
const TextStyle _defaultTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 14,
);

class AtTimeSeriesPainter extends CustomPainter {
  /// Takes data to make chart
  final AtTimeSeriesData data;
  final AtTimeSeriesStyle style;

  /// This paint used to draw GridLines.
  late Paint gridLinePaint;

  AtTimeSeriesPainter({
    required this.data,
    required this.style,
  }) {
    gridLinePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = _gridLineWidth
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //Draw border
    _drawPlotBorder(canvas, size);
    //Draw minor grid line
    if (style.drawMinorGridLine) {
      _drawMinorGridLine(canvas, size);
    }
    //Draw major grid line
    if (style.drawMajorGridLine) {
      _drawMajorGridLine(canvas, size);
    }
    //Draw chart series
    drawChartSeries(canvas, size);
    //Draw y axis title
    if (style.drawYAxisTitle) {
      _drawYAxisTitle(canvas, size);
    }
    //Draw x axis title
    if (style.drawXAxisTitle) {
      _drawXAxisTitle(canvas, size);
    }
    //Draw y axis label
    if (style.drawYAxisLabel) {
      _drawYAxisLabel(canvas, size);
    }
    //Draw x axis label
    if (style.drawXAxisLabel) {
      _drawXAxisLabel(canvas, size);
    }
  }

  /// Draw plot border
  void _drawPlotBorder(Canvas canvas, Size size) {
    final cPadding = style.plotAreaMargin;
    final xPath = Path();
    xPath.moveTo(cPadding.left, cPadding.top);
    xPath.lineTo(cPadding.left, size.height - cPadding.bottom);
    xPath.lineTo(size.width - cPadding.right, size.height - cPadding.bottom);
    xPath.lineTo(size.width - cPadding.right, cPadding.top);
    xPath.lineTo(cPadding.left, cPadding.top);

    final xPaint = Paint()
      ..color = style.plotBorderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = style.plotBorderWidth;

    canvas.drawPath(xPath, xPaint);
  }

  void drawChartSeries(Canvas canvas, Size size) {}

  void _drawMinorGridLine(Canvas canvas, Size size) {
    final plotAreaMargin = style.plotAreaMargin;
    final plotAreaSize = Size(size.width - plotAreaMargin.horizontal,
        size.height - plotAreaMargin.vertical);
    final plotAreaOffset = Offset(plotAreaMargin.top, plotAreaMargin.left);
    final verticalPath = Path();

    for (int i = 0; i < data.numOfIntervals; i++) {
      verticalPath.moveTo(
        plotAreaSize.width / data.numOfIntervals * (i + 0.5) +
            plotAreaOffset.dy,
        size.height - plotAreaMargin.bottom - style.plotBorderWidth,
      );

      verticalPath.lineTo(
        plotAreaSize.width / data.numOfIntervals * (i + 0.5) +
            plotAreaOffset.dy,
        0,
      );
    }
    canvas.drawPath(verticalPath, gridLinePaint);
  }

  void _drawMajorGridLine(Canvas canvas, Size size) {
    final yPath = Path();
    final cPadding = style.plotAreaMargin;

    for (int i = 1; i < data.numOfYLabel; i++) {
      yPath.moveTo(
          cPadding.left + _gridLineWidth,
          cPadding.top +
              (size.height - cPadding.vertical) / data.numOfYLabel * i);
      yPath.lineTo(
          (size.width - cPadding.right),
          cPadding.top +
              (size.height - cPadding.vertical) / data.numOfYLabel * i);
    }

    canvas.drawPath(yPath, gridLinePaint);
  }

  void _drawYAxisTitle(Canvas canvas, Size size) {
    canvas.save();
    canvas.rotate(pi / 2);
    final cPadding = style.plotAreaMargin;
    final ySpan = TextSpan(
      text: style.yAxisTitle?.data,
      style: style.yAxisTitle?.style ?? _defaultTextStyle,
    );

    if (style.drawYAxisLabel) {
      TextPainter yTp = TextPainter(
        text: ySpan,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
      );

      yTp.layout(
        minWidth: 0,
        maxWidth: size.width,
      );

      yTp.paint(
        canvas,
        Offset((size.height - cPadding.vertical) / 2 - yTp.size.width / 2,
            -(style.yAxisTitle?.style?.fontSize ?? 14) - 5),
      );
    }
    canvas.restore();
  }

  void _drawXAxisTitle(Canvas canvas, Size size) {
    final xAxisTitle = style.xAxisTitle;
    final cPadding = style.plotAreaMargin;

    if (xAxisTitle != null) {
      TextPainter xTp = TextPainter(
        text: TextSpan(
          text: xAxisTitle.data,
          style: xAxisTitle.style ?? _defaultTextStyle,
        ),
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
      );

      xTp.layout(
        minWidth: 0,
        maxWidth: size.width,
      );
      xTp.paint(
          canvas,
          Offset((size.width + cPadding.right) / 2 - xTp.size.width / 2,
              size.height - (xAxisTitle.style?.fontSize ?? 14) - 2));
    }
  }

  void _drawYAxisLabel(Canvas canvas, Size size) {
    final plotAreaMargin = style.plotAreaMargin;

    ///Draw y axis label
    for (int i = 0; i <= data.numOfYLabel; i++) {
      final value = data.minY + i * (data.maxY - data.minY) / data.numOfYLabel;
      final span = TextSpan(
        text: style.yLabelFormatter?.call(value) ?? value.toStringAsFixed(0),
        style: style.yAxisLabelStyle ?? _defaultTextStyle,
      );
      TextPainter yAxisTp = TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
      );
      yAxisTp.layout(
        minWidth: 0,
        maxWidth: size.width,
      );

      yAxisTp.paint(
          canvas,
          Offset(
              plotAreaMargin.left - yAxisTp.size.width - 3,
              (size.height - plotAreaMargin.bottom) -
                  yAxisTp.size.height / 2 -
                  i *
                      (size.height - plotAreaMargin.vertical) /
                      data.numOfYLabel));
    }
  }

  void _drawXAxisLabel(Canvas canvas, Size size) {
    final plotAreaMargin = style.plotAreaMargin;
    final plotAreaSize = Size(size.width - plotAreaMargin.horizontal,
        size.height - plotAreaMargin.vertical);
    final plotAreaOffset = Offset(plotAreaMargin.top, plotAreaMargin.left);

    ///Draw x axis label
    for (int i = 0; i < data.numOfIntervals; i++) {
      if (i < data.numOfIntervals - data.timeCoordinate.length) {
        continue;
      }
      final position = i - data.numOfIntervals + data.timeCoordinate.length;
      final value = data.timeCoordinate[position];

      final timeSpan = TextSpan(
        text: style.xLabelFormatter?.call(value, position) ??
            "${value.time.hour}:${value.time.minute}:${value.time.second}",
        style: style.xAxisLabelStyle ?? _defaultTextStyle,
      );

      TextPainter xAxisTp = TextPainter(
        text: timeSpan,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
      );

      xAxisTp.layout(
        minWidth: 0,
        maxWidth: size.width,
      );

      xAxisTp.paint(
        canvas,
        Offset(
          plotAreaSize.width / data.numOfIntervals * (i + 0.5) +
              plotAreaOffset.dy -
              xAxisTp.size.width / 2,
          size.height - plotAreaMargin.bottom + 5,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
