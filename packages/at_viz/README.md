<img width=250px src="https://atsign.dev/assets/img/atPlatform_logo_gray.svg?sanitize=true">

## Overview
<!---
## Who is this for?
The README should be addressed to somebody who's never seen this before.
But also don't assume that they're a novice.
-->
The at_viz package is for Flutter developers who want to build beautiful and customizable charts and gauges.

<!---
Give some context and state the intent - we welcome contributions - we want
pull requests and to hear about issues. Include the boilerplate language
below to add some context to @‎platform packages 
-->
This open source package is written in Dart, and it supports Flutter with the following widgets: 


##### SimpleRadialGauge

![simple radial gauges gif](https://raw.githubusercontent.com/atsign-foundation/at_gauges/trunk/gifs/simple_radial_gauge.gif)

##### ScaleRadialGauge

![scale radial gauge gif](https://raw.githubusercontent.com/atsign-foundation/at_gauges/trunk/gifs/scale_gauge.gif)

##### SegmentRadialGauge

![segment radial gauge gif](https://raw.githubusercontent.com/project2021-code/at_viz/trunk/at_viz/lib/at_gauges/gifs/segment_gauge.gif)

##### SimpleLinearGauge

![simple linear gauge gif](https://raw.githubusercontent.com/atsign-foundation/at_gauges/trunk/gifs/linear_gauge.gif)
<!-- - Range radial gauge -->
  <!--- add package features here -->

##### AtTimeSeriesLineChart

<img src="https://user-images.githubusercontent.com/88494375/199918844-105c0c55-3ede-4621-8f92-33bad536e6c7.png" width="250" alt="accessibility text">

##### AtTimeSeriesBarChart

<img src="https://user-images.githubusercontent.com/88494375/199925121-4cf4f2f2-4448-455b-b59a-b963d335bd96.png" width="250" alt="accessibility text">

We welcome suggestions you may have to create more charts/gauges or to add features to already created ones.

## How it works

<!---
Add details on how to setup the package
-->
### Setup
This package needs to be imported as shown below:
```dart
import 'package:at_viz/at_charts/at_time_series_chart/lib/at_time_series_chart.dart';

import 'package:at_viz/at_gauges/linear_gauges/simple_linear_gauge.dart';
import 'package:at_viz/at_gauges/radial_gauges/scale_radial_gauge.dart';
import 'package:at_viz/at_gauges/radial_gauges/simple_radial_gauge.dart';
import 'package:at_viz/at_gauges/radial_gauges/segment_radial_gauge.dart';
```
<!---
Add details on how to use the package in an application
-->
### Usage

<!---
Make sure your source code annotations are clear and comprehensive.
-->

#### Simple Line Chart Example

```dart
AtTimeSeriesChart.line(
data: lineData,
style: lineChartStyle,
backgroundColor: Colors.white,
),
```

#### Simple Bar Chart Example

```dart
AtTimeSeriesChart.bar(
data: barData,
style: barChartStyle,
backgroundColor: Colors.white,
),
```

#### Simple Radial Gauge Example

The code snippet below shows the simple gauge widget with the required `actualValue`, `maxValue` and the optional properties. 

```dart
SimpleRadialGauge(
    actualValue: 50,
    maxValue: 100,
    // Optional Parameters
    minValue: 0,
    title: Text('Simple Radial Gauge'),
    titlePosition: TitlePosition.top,
    unit: 'L',
    icon: Icon(Icons.water),
    pointerColor: Colors.blue,
    decimalPlaces: 0,
    isAnimate: true,
    animationDuration: 2000,
    size: 400,
),
```
#### Scale Radial Gauge

The code snippet below shows the scale gauge widget with the required `actualValue`, `maxValue` and the optional properties.
```dart
ScaleRadialGauge(
    maxValue: 100,
    actualValue: 70,
    // Optional Parameters
    minValue: 0,
    size: 400,
    title: Text('Scale Radial Gauge'),
    titlePosition: TitlePosition.top,
    pointerColor: Colors.blue,
    needleColor: Colors.blue,
    decimalPlaces: 0,
    isAnimate: true,
    animationDuration: 2000,
    unit: TextSpan(text: 'Km/h', style: TextStyle(fontSize: 10)),
)
```
#### Simple Linear Gauge

The code snippet below shows the simple linear gauge widget with the required `actualValue`, `maxValue` and the optional properties.

```dart
SimpleLinearGauge(
    maxValue: 100,
    actualValue: 76,
    //Optional Parameters
    minValue: 0,
    divisions: 10,
    title: const Text('Simple Linear Gauge'),
    titlePosition: TitlePosition.top,
    pointerColor: Colors.blue,
    pointerIcon: const Icon(Icons.water_drop, color: Colors.blue),
    decimalPlaces: 0,
    isAnimate: true,
    animationDuration: 2000,
    gaugeOrientation: GaugeOrientation.vertical,
    gaugeStrokeWidth: 5,
    rangeStrokeWidth: 5,
    majorTickStrokeWidth: 3,
    minorTickStrokeWidth: 3,
    actualValueTextStyle: const TextStyle(color: Colors.black, fontSize: 15),
    majorTickValueTextStyle: const TextStyle(color: Colors.black),
),
```
#### Segment Radial Gauge

The code snippet below shows the segment gauge widget with the required `actualValue`, `maxValue` and the optional properties.
```dart
SegmentRadialGauge(
    maxValue: _maxValue,
    actualValue: _value,
    // Optional Parameters
    minValue: _minValue,
    size: 250,
    title: const Text('Segment Radial Gauge'),
    titlePosition: TitlePosition.top,
    pointerColor: Colors.cyan,
    needleColor: Colors.cyan,
    decimalPlaces: 2,
    isAnimate: true,
    animationDuration: 125,
    unit: const TextSpan(
    text: 'V',
    style: TextStyle(
        fontSize: 10,
        color: Colors.cyan,
        ),
    ),
    isPointer: false,
    // titleText: "Title",
    // title2Text: "Title2",
    segmentStartAngle: 135,
    segmentSweepAngle: 270,
    segmentMainNo: 8,
    segmentSubNo: 5,
    segmentList: [
        ZoneSegment(
            size: 1,
            color: Colors.red.withOpacity(0.95),
        ),
        ZoneSegment(
            size: 2,
            color: Colors.blue.withOpacity(0.95),
        ),
        ZoneSegment(
            size: 1,
            color: Colors.orangeAccent.withOpacity(0.95),
        ),
        ZoneSegment(
            size: 4,
            color: Colors.greenAccent.withOpacity(0.95),
        ),
    ],
    customLabel: true,
    labelList: [
        CustomLabel(text: '0', fontSize: 16, xOffset: -40, yOffset: 40),
        CustomLabel(text: '8', fontSize: 16, xOffset: -5, yOffset: -60),
        CustomLabel(text: '16', fontSize: 16, xOffset: 25, yOffset: 40),
        CustomLabel(text: 'Title', fontSize: 12, xOffset: -12, yOffset: 60),
        CustomLabel(text: 'Title2', fontSize: 18, xOffset: -24, yOffset: -39),
    ],
    actualValueFontSize: 16,
),
```

For more information, please see the example tab or API documentation listed on pub.dev.


## Open source usage and contributions
This is open source code, so feel free to use it as is, suggest changes or 
enhancements or create your own version. See [CONTRIBUTING.md](CONTRIBUTING.md) 
for detailed guidance on how to setup tools, tests and make a pull request.

## Maintainers

Created by:
[Curtly Critchlow](https://github.com/CurtlyCritchlow)
[SonLe](https://github.com/sonle-geekyants)
