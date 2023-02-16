import 'dart:ui';

import '../utils/at_time_series_painter.dart';

///Line painter
class AtTimeSeriesLinePainter extends AtTimeSeriesPainter {
  AtTimeSeriesLinePainter({
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
    final positions = <Offset>[];

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
            plotAreaOffset.dx,
      );

      positions.add(offset);
    }

    final linePaint = Paint()
      ..color = chartSeriesColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = style.chartSeriesWidth;

    if (positions.isNotEmpty) {
      final path = _getPoints(positions, size);

      canvas.drawPath(path, linePaint);
    }
  }

  /// Smooth out points and return path in turn
  /// Smoothing is done with quadratic bezier
  Path _getPoints(List<Offset> points, Size size) {
    final path = Path();

    path.moveTo(points[0].dx, points[0].dy);
    path.lineTo(points.first.dx, points.first.dy);

    for (var i = 0; i < points.length - 1; i++) {
      final p1 = points[i % points.length];
      final p2 = points[(i + 1) % points.length];
      final controlPointX = p1.dx + ((p2.dx - p1.dx) / 2);
      final mid = (p1 + p2) / 2;
      final firstLERPValue =
          lerpDouble(mid.dx, controlPointX, 1) ?? size.height;
      final secondLERPValue = lerpDouble(mid.dy, p2.dy, 1) ?? size.height;

      path.cubicTo(
          controlPointX, p1.dy, firstLERPValue, secondLERPValue, p2.dx, p2.dy);

      if (i == points.length - 2) {
        path.lineTo(p2.dx, p2.dy);
      }
    }

    return path;
  }
}
