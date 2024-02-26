<!---
Adding the atPlatform logos gives a nice look for your readme
-->
<a href="https://atsign.com#gh-light-mode-only"><img width=250px src="https://atsign.com/wp-content/uploads/2022/05/atsign-logo-horizontal-color2022.svg#gh-light-mode-only" alt="The Atsign Foundation"></a><a href="https://atsign.com#gh-dark-mode-only"><img width=250px src="https://atsign.com/wp-content/uploads/2023/08/atsign-logo-horizontal-reverse2022-Color.svg#gh-dark-mode-only" alt="The Atsign Foundation"></a>

<!---
Add a badge bar for your package by replacing at_time_series_chart below with
your package name below and at_time_series_chart with the name of the repo
-->
[![pub package](https://img.shields.io/pub/v/at_charts)](https://pub.dev/packages/at_charts) [![pub points](https://badges.bar/at_charts/pub%20points)](https://pub.dev/packages/at_charts/score) [![build status](https://github.com/atsign-foundation/at_charts/actions/workflows/at_charts.yaml/badge.svg?branch=trunk)](https://github.com/atsign-foundation/at_charts/actions/workflows/at_charts.yaml) [![gitHub license](https://img.shields.io/badge/license-BSD3-blue.svg)](./LICENSE)

## Overview
<!---
## Who is this for?
The README should be addressed to somebody who's never seen this before.
But also don't assume that they're a novice.
-->
The at_charts package is for Flutter developers who want to build beautiful and customizable charts.

<!---
Give some context and state the intent - we welcome contributions - we want
pull requests and to hear about issues. Include the boilerplate language
below to add some context to @‎platform packages 
-->
This open source package is written in Dart, and it supports Flutter with the following widgets:

##### AtTimeSeriesLineChart

<img src="https://user-images.githubusercontent.com/88494375/199918844-105c0c55-3ede-4621-8f92-33bad536e6c7.png" width="250" alt="accessibility text">

##### AtTimeSeriesBarChart

<img src="https://user-images.githubusercontent.com/88494375/199925121-4cf4f2f2-4448-455b-b59a-b963d335bd96.png" width="250" alt="accessibility text">

We welcome suggestions you may have to create more charts or to add features to charts already created.

<!---
Does this package publish to pub.dev or similar? This README will be the
first thing that developers see there and should be written such that it
lets them quickly assess if it fits their need.
-->
## Get started
There are two options to get started using this package.

<!---
If the package has a template that at_app uses to generate a skeleton app,
that is the quickest way for a developer to assess it and get going with
their app.
-->
<!-- ### 1. Quick start - generate a skeleton app with at_app
This package includes a working sample application in the
[Example](./example) directory that you can use to create a personalized
copy using ```at_app create``` in four commands.

```sh
$ flutter pub global activate at_app 
$ at_app create --sample=<package ID> <app name> 
$ cd <app name>
$ flutter run
```
Notes: 
1. You only need to run ```flutter pub global activate``` once
2. Use ```at_app.bat``` for Windows -->


<!---
Cloning the repo and example app from GitHub is the next option for a
developer to get started.
-->
### 1. Clone it from GitHub
<!---
Make sure to edit the link below to refer to your package repo.
-->
Feel free to fork a copy of the source from the [GitHub repo](https://github.com/atsign-foundation/at_charts).

```sh
$ git clone https://github.com/atsign-foundation/at_charts
```

<!---
The last option is to use the traditionaL instructions for adding the package to a project which can be found on pub.dev. 
Please be sure to replace the package name in the url below the right one for this package.
-->
### 2. Manually add the package to a project

Instructions on how to manually add this package to your project can be found on pub.dev [here](https://pub.dev/packages/at_charts/install).

<!---
Include an explanation on how to setup and use the package
-->
## How it works

<!---
Add details on how to setup the package
-->
### Setup
This package needs to be imported as shown below:
```dart
import 'package:at_time_series_chart/at_time_series_chart.dart';
```
<!---
Add details on how to use the package in an application
-->
### Usage

<!---
Make sure your source code annotations are clear and comprehensive.
-->

This package provides two beautiful charts.

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

For more information, please see the example tab or API documentation listed on pub.dev.


<!---
If we have any pages for these docs on atsign.dev site, it would be 
good to add links.(optional)
-->

<!---
You should include language like below if you would like others to contribute
to your package.
-->
## Open source usage and contributions
This is open source code, so feel free to use it as is, suggest changes or
enhancements or create your own version. See [CONTRIBUTING.md](CONTRIBUTING.md)
for detailed guidance on how to setup tools, tests and make a pull request.

## Maintainers

Created by:
[SonLe](https://github.com/sonle-geekyants)