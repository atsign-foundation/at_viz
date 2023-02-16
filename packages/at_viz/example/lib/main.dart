import 'package:at_viz_example/screens/gauges.dart';
import 'package:at_viz_example/screens/time_series.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExampleBody();
  }
}

class ExampleBody extends StatefulWidget {
  const ExampleBody({super.key});

  @override
  State<ExampleBody> createState() => _ExampleBodyState();
}

class _ExampleBodyState extends State<ExampleBody> {
  var _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _navigationBarBody = [
    const TimeSeriesChartExample(
      title: 'Charts example',
    ),
    const GaugesExample()
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart_sharp),
              label: 'Charts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_off_outlined),
              label: 'Gauges',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        body: _navigationBarBody[_selectedIndex],
      ),
    );
  }
}
