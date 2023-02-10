part of at_time_series_chart;

class AtTimeSeriesData {
  /// Each [AtTimeCoordinate] is a point to draw ChartSeries
  final List<AtTimeCoordinate> timeCoordinate;

  /// Set time to update Chart
  final double intervalTimeInSeconds;

  /// Min value for Y axis
  final double minY;

  /// Max value for Y axis
  final double maxY;

  /// Set the total number of ChartSeries displayed
  final int numOfIntervals;

  /// Set the total number of [yAxisTitle] displayed
  final int numOfYLabel;

  AtTimeSeriesData({
    required this.timeCoordinate,
    required this.intervalTimeInSeconds,
    required this.minY,
    required this.maxY,
    this.numOfIntervals = 10,
    this.numOfYLabel = 5,
  });

  void insertSpot({required AtTimeCoordinate coordinates}) {
    timeCoordinate.add(coordinates);
  }
}