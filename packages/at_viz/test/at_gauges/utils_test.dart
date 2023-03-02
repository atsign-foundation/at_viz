// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:at_viz/at_gauges/utils/radial_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('utils functions', () {
    test('radians should be 6.28319', (() {
      expect(RadialHelper.degreesToRadians(360), 6.283185307179586);
    }));

    test('degrees should be 360', (() {
      expect(RadialHelper.radiansToDegrees(6.283185307179586), 360);
    }));

    test('sweepAngle should be 180', (() {
      expect(
          RadialHelper.actualValueToSweepAngle(
              actualValue: 10, maxValue: 20, maxDegrees: 360),
          180);
    }));

    test('actual value should be 50', () {
      expect(
          RadialHelper.sweepAngleToActualValue(
              sweepAngle: RadialHelper.degreesToRadians(180),
              maxValue: 100,
              maxDegrees: 360,
              minValue: 0),
          50);
    });
  });
}
