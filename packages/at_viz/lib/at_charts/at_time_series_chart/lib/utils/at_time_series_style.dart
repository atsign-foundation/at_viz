part of at_time_series_chart;

class AtTimeSeriesStyle {
  /// Set border width for chart
  final double plotBorderWidth;

  /// Set width for chartSeries
  double chartSeriesWidth;

  /// Margin for plot area
  final EdgeInsets plotAreaMargin;

  /// Set [xAxisTitle] for Chart
  final Text? xAxisTitle;

  /// Set [yAxisTitle] for Chart
  final Text? yAxisTitle;

  /// Set text style for yAxisLabel
  final TextStyle? yAxisLabelStyle;

  /// Set text style for xAxisLabel
  final TextStyle? xAxisLabelStyle;

  /// Hide or show Minor Grid Line
  final bool drawMinorGridLine;

  /// Hide or show Major Grid Line
  final bool drawMajorGridLine;

  /// Hide or show YAxisTitle
  final bool drawYAxisTitle;

  /// Hide or show YAxisLabel
  final bool drawYAxisLabel;

  /// Hide or show XAxisTitle
  final bool drawXAxisTitle;

  /// Hide or show XAxisLabel
  final bool drawXAxisLabel;

  /// Set color to ChartSeries
  final Color chartSeriesColor;

  /// Set color to paint PlotBorder
  final Color plotBorderColor;

  /// Format value to display yAxisLabel
  final String Function(double)? yLabelFormatter;

  /// Format value to display xAxisLabel
  final String Function(
    AtTimeCoordinate coordinates,
    int position,
  )? xLabelFormatter;

  AtTimeSeriesStyle._({
    this.plotBorderWidth = 1,
    this.chartSeriesWidth = 10,
    this.plotAreaMargin = const EdgeInsets.only(left: 40, bottom: 40),
    this.xAxisTitle,
    this.yAxisTitle,
    this.yAxisLabelStyle,
    this.xAxisLabelStyle,
    this.drawMinorGridLine = true,
    this.drawMajorGridLine = true,
    this.drawYAxisTitle = true,
    this.drawYAxisLabel = true,
    this.drawXAxisTitle = true,
    this.drawXAxisLabel = true,
    this.chartSeriesColor = const Color(0xFFf4533d),
    this.plotBorderColor = Colors.blue,
    this.yLabelFormatter,
    this.xLabelFormatter,
  });

  factory AtTimeSeriesStyle.bar({
    double plotBorderWidth = 1,
    double columnWidth = 10,
    EdgeInsets plotAreaMargin = const EdgeInsets.only(left: 40, bottom: 40),
    Text? xAxisTitle,
    Text? yAxisTitle,
    TextStyle? yAxisLabelStyle,
    TextStyle? xAxisLabelStyle,
    bool drawMinorGridLine = true,
    bool drawMajorGridLine = true,
    bool drawYAxisTitle = true,
    bool drawYAxisLabel = true,
    bool drawXAxisTitle = true,
    bool drawXAxisLabel = true,
    Color chartSeriesColor = const Color(0xFFf4533d),
    Color plotBorderColor = Colors.blue,
    String Function(double)? yLabelFormatter,
    String Function(AtTimeCoordinate coordinates, int position)?
        xLabelFormatter,
  }) {
    return AtTimeSeriesStyle._(
      plotBorderWidth: plotBorderWidth,
      chartSeriesWidth: columnWidth,
      plotAreaMargin: plotAreaMargin,
      xAxisTitle: xAxisTitle,
      yAxisTitle: yAxisTitle,
      yAxisLabelStyle: yAxisLabelStyle,
      xAxisLabelStyle: xAxisLabelStyle,
      drawMinorGridLine: drawMinorGridLine,
      drawMajorGridLine: drawMajorGridLine,
      drawYAxisTitle: drawYAxisTitle,
      drawYAxisLabel: drawYAxisLabel,
      drawXAxisTitle: drawXAxisTitle,
      drawXAxisLabel: drawXAxisLabel,
      chartSeriesColor: chartSeriesColor,
      plotBorderColor: plotBorderColor,
      yLabelFormatter: yLabelFormatter,
      xLabelFormatter: xLabelFormatter,
    );
  }

  factory AtTimeSeriesStyle.line({
    double plotBorderWidth = 1,
    double lineWidth = 10,
    EdgeInsets plotAreaMargin = const EdgeInsets.only(left: 40, bottom: 40),
    Text? xAxisTitle,
    Text? yAxisTitle,
    TextStyle? yAxisLabelStyle,
    TextStyle? xAxisLabelStyle,
    bool drawMinorGridLine = true,
    bool drawMajorGridLine = true,
    bool drawYAxisTitle = true,
    bool drawYAxisLabel = true,
    bool drawXAxisTitle = true,
    bool drawXAxisLabel = true,
    Color chartSeriesColor = const Color(0xFFf4533d),
    Color plotBorderColor = Colors.blue,
    String Function(double)? yLabelFormatter,
    String Function(AtTimeCoordinate coordinates, int position)?
        xLabelFormatter,
  }) {
    return AtTimeSeriesStyle._(
      plotBorderWidth: plotBorderWidth,
      chartSeriesWidth: lineWidth,
      plotAreaMargin: plotAreaMargin,
      xAxisTitle: xAxisTitle,
      yAxisTitle: yAxisTitle,
      yAxisLabelStyle: yAxisLabelStyle,
      xAxisLabelStyle: xAxisLabelStyle,
      drawMinorGridLine: drawMinorGridLine,
      drawMajorGridLine: drawMajorGridLine,
      drawYAxisTitle: drawYAxisTitle,
      drawYAxisLabel: drawYAxisLabel,
      drawXAxisTitle: drawXAxisTitle,
      drawXAxisLabel: drawXAxisLabel,
      chartSeriesColor: chartSeriesColor,
      plotBorderColor: plotBorderColor,
      yLabelFormatter: yLabelFormatter,
      xLabelFormatter: xLabelFormatter,
    );
  }
}
