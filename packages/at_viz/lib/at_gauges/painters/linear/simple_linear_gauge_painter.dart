import 'package:at_viz/at_gauges/utils/abstract_classes.dart';
import 'package:at_viz/at_gauges/utils/enums.dart';
import 'package:flutter/material.dart';

class SimpleLinearGaugePainter extends LinearCustomPainter {
  SimpleLinearGaugePainter({
    required double minValue,
    required double maxValue,
    required double actualValue,
    required int divisions,
    required Text title,
    required TitlePosition titlePosition,
    required GaugeOrientation gaugeOrientation,
    required Color pointerColor,
    required Icon pointerIcon,
    required int decimalPlaces,
    required double rangeStrokeWidth,
    required double gaugeStrokeWidth,
    required double majorTickStrokeWidth,
    required double minorTickStrokeWidth,
    required TextStyle actualValueTextStyle,
    required TextStyle majorTicksValueTextStyle,
  }) : super(
          minValue: minValue,
          maxValue: maxValue,
          actualValue: actualValue,
          divisions: divisions,
          title: title,
          titlePosition: titlePosition,
          pointerColor: pointerColor,
          pointerIcon: pointerIcon,
          decimalPlaces: decimalPlaces,
          gaugeStrokeWidth: gaugeStrokeWidth,
          rangeStrokeWidth: rangeStrokeWidth,
          majorTickStrokeWidth: majorTickStrokeWidth,
          minorTickStrokeWidth: minorTickStrokeWidth,
          actualValueTextStyle: actualValueTextStyle,
          majorTicksValueTextStyle: majorTicksValueTextStyle,
          gaugeOrientation: gaugeOrientation,
        );

  @override
  void paint(Canvas canvas, Size size) {
    super.paint(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
