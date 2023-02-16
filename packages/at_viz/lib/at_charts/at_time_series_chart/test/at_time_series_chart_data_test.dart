import 'package:at_time_series_chart/at_time_series_chart.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AtTimeSeriesData data;

  setUp(() {
    data = AtTimeSeriesData(
      timeCoordinate: [],
      intervalTimeInSeconds: 0.1,
      minY: 20,
      maxY: 50,
    );
  });

  test("Test AtTimeSpot data empty", () {
    expect(data.timeCoordinate.isEmpty, true);
  });

  test("Test insert AtTimeSpot to Chart data", () {
    data.insertSpot(coordinates: AtTimeCoordinate(DateTime.now(), 30));
    expect(data.timeCoordinate.isNotEmpty, true);
  });
}
