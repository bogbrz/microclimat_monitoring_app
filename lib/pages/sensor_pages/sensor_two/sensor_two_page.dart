import 'package:flutter/material.dart';

class SensorPage2 extends StatefulWidget {
  const SensorPage2({
    required this.sensorNumber,
    super.key,
  });
  final int sensorNumber;

  @override
  State<SensorPage2> createState() => _SensorOnePageState();
}

class _SensorOnePageState extends State<SensorPage2> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
