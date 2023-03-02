import 'package:flutter/material.dart';

import '../utils/at_time_series_painter.dart';

///Bar painter
class AtTimeSeriesBarPainter extends AtTimeSeriesPainter {
  AtTimeSeriesBarPainter({
    required super.data,
    required super.style,
  });

  @override
  void drawChartSeries(Canvas canvas, Size size) {
    final plotAreaMargin = style.plotAreaMargin;
    final plotAreaSize = Size(size.width - plotAreaMargin.horizontal,
        size.height - plotAreaMargin.vertical);
    final plotAreaOffset = Offset(plotAreaMargin.top, plotAreaMargin.left);
    final chartSeriesColor = style.chartSeriesColor;

    ///Draw line
    final linePaint = Paint()
      ..color = chartSeriesColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = style.chartSeriesWidth;

    for (int i = 0; i < data.numOfIntervals; i++) {
      if (i < data.numOfIntervals - data.timeCoordinate.length) {
        continue;
      }

      final spot = data
          .timeCoordinate[i - data.numOfIntervals + data.timeCoordinate.length];

      final offset = Offset(
          plotAreaSize.width / data.numOfIntervals * (i + 0.5) +
              plotAreaOffset.dy,
          (data.maxY - spot.y) / (data.maxY - data.minY) * plotAreaSize.height +
              plotAreaOffset.dx);

      canvas.drawLine(
        offset,
        Offset(
            offset.dx,
            plotAreaSize.height +
                plotAreaMargin.top -
                style.plotBorderWidth / 2),
        linePaint,
      );
    }
  }
}
