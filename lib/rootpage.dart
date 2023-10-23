import 'package:flutter/material.dart';
import 'package:microclimat_monitoring_app/pages/data_page/sensor_one_page.dart';
import 'package:microclimat_monitoring_app/home.dart';

class RootPage extends StatefulWidget {
  const RootPage({
    super.key,
  });

  @override
  State<RootPage> createState() => _AllSensorsDataState();
}

var currentIndex = 0;

class _AllSensorsDataState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (currentIndex == 0) {
            return const HomePage();
          }
          return const SensorOnePage();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newValue) => setState(() {
          currentIndex = newValue;
        }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "data")
        ],
      ),
    );
  }
}
