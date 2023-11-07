import 'package:flutter/material.dart';

class SensorPage3 extends StatefulWidget {
  const SensorPage3({
    required this.sensorNumber,
    super.key,
  });
  final int sensorNumber;

  @override
  State<SensorPage3> createState() => _SensorOnePageState();
}

class _SensorOnePageState extends State<SensorPage3> {
  Color color = Colors.grey;
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
