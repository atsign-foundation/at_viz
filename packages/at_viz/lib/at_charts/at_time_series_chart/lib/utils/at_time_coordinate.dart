part of at_time_series_chart;

/// Represents a conceptual position in cartesian (axis based) space.
class AtTimeCoordinate {
  /// [time] determines cartesian (axis based) horizontally position
  ///
  /// [y] determines cartesian (axis based) vertically position
  /// 0 means most bottom point of the chart
  const AtTimeCoordinate(this.time, this.y);

  final DateTime time;
  final double y;
}
