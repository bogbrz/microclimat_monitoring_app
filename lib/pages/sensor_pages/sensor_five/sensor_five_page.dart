import 'package:flutter/material.dart';

class SensorPage5 extends StatefulWidget {
  const SensorPage5({
    required this.sensorNumber,
    super.key,
  });
  final int sensorNumber;

  @override
  State<SensorPage5> createState() => _SensorOnePageState();
}

class _SensorOnePageState extends State<SensorPage5> {
  // @override
  // void initState() {
  //   super.initState();
  //   colorNotifier.addListener(() {
  //     setState(() {
  //       color = colorNotifier.value;
  //     });
  //   });
  // }

  Color color = Colors.grey;
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;

  // ValueNotifier<Color?> colorNotifier = ValueNotifier<Color?>(null);
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
