import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_five_cubit/cubit/sensor_five_cubit.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_four_cubit/cubit/sensor_four_cubit.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_one_cubit/cubit/sensor_one_cubit.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_three_cubit/cubit/sensor_three_cubit.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_two_cubit/cubit/sensor_two_cubit.dart';
class SensorFiveStatus extends StatelessWidget {
  const SensorFiveStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SensorFiveCubit, SensorFiveState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Sensor 5",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text("Temperature", style: TextStyle(fontSize: 13)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.isCorrect == false ? Colors.red : Colors.green,
                  border: Border.all(width: 2, color: Colors.white)),
              alignment: Alignment.center,
              child: const Text("°C"),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("Humidity", style: TextStyle(fontSize: 12.5)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.isCorrect2 == false ? Colors.red : Colors.green,
                  border: Border.all(width: 2, color: Colors.white)),
              alignment: Alignment.center,
              child: const Icon(Icons.water_drop),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("Noise", style: TextStyle(fontSize: 12.5)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.isCorrect3 == false ? Colors.red : Colors.green,
                  border: Border.all(width: 2, color: Colors.white)),
              alignment: Alignment.center,
              child: const Icon(Icons.noise_aware_rounded),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        );
      },
    );
  }
}

class SensorFourStatus extends StatelessWidget {
  const SensorFourStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SensorFourCubit, SensorFourState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Sensor 4",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text("Temperature", style: TextStyle(fontSize: 13)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.isCorrect == false ? Colors.red : Colors.green,
                  border: Border.all(width: 2, color: Colors.white)),
              alignment: Alignment.center,
              child: const Text("°C"),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("Humidity", style: TextStyle(fontSize: 12.5)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.isCorrect2 == false ? Colors.red : Colors.green,
                  border: Border.all(width: 2, color: Colors.white)),
              alignment: Alignment.center,
              child: const Icon(Icons.water_drop),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("Noise", style: TextStyle(fontSize: 12.5)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.isCorrect3 == false ? Colors.red : Colors.green,
                  border: Border.all(width: 2, color: Colors.white)),
              alignment: Alignment.center,
              child: const Icon(Icons.noise_aware_rounded),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        );
      },
    );
  }
}

class SensorThreeStatus extends StatelessWidget {
  const SensorThreeStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SensorThreeCubit, SensorThreeState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Sensor 3",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text("Temperature", style: TextStyle(fontSize: 13)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.isCorrect == false ? Colors.red : Colors.green,
                  border: Border.all(width: 2, color: Colors.white)),
              alignment: Alignment.center,
              child: const Text("°C"),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("Humidity", style: TextStyle(fontSize: 12.5)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.isCorrect2 == false ? Colors.red : Colors.green,
                  border: Border.all(width: 2, color: Colors.white)),
              alignment: Alignment.center,
              child: const Icon(Icons.water_drop),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("Noise", style: TextStyle(fontSize: 12.5)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.isCorrect3 == false ? Colors.red : Colors.green,
                  border: Border.all(width: 2, color: Colors.white)),
              alignment: Alignment.center,
              child: const Icon(Icons.noise_aware_rounded),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        );
      },
    );
  }
}

class SensorTwoStatus extends StatelessWidget {
  const SensorTwoStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SensorTwoCubit, SensorTwoState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Sensor 2",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text("Temperature", style: TextStyle(fontSize: 13)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.isCorrect == false ? Colors.red : Colors.green,
                  border: Border.all(width: 2, color: Colors.white)),
              alignment: Alignment.center,
              child: const Text("°C"),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("Humidity", style: TextStyle(fontSize: 12.5)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.isCorrect2 == false ? Colors.red : Colors.green,
                  border: Border.all(width: 2, color: Colors.white)),
              alignment: Alignment.center,
              child: const Icon(Icons.water_drop),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("Noise", style: TextStyle(fontSize: 12.5)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.isCorrect3 == false ? Colors.red : Colors.green,
                  border: Border.all(width: 2, color: Colors.white)),
              alignment: Alignment.center,
              child: const Icon(Icons.noise_aware_rounded),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        );
      },
    );
  }
}

class SensorOneStatus extends StatelessWidget {
  const SensorOneStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SensorOneCubit, SensorOneState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Sensor 1",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text("Temperature", style: TextStyle(fontSize: 13)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.isCorrect == false ? Colors.red : Colors.green,
                  border: Border.all(width: 2, color: Colors.white)),
              alignment: Alignment.center,
              child: const Text("°C"),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("Humidity", style: TextStyle(fontSize: 12.5)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.isCorrect2 == false ? Colors.red : Colors.green,
                  border: Border.all(width: 2, color: Colors.white)),
              alignment: Alignment.center,
              child: const Icon(Icons.water_drop),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("Noise", style: TextStyle(fontSize: 12.5)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.isCorrect3 == false ? Colors.red : Colors.green,
                  border: Border.all(width: 2, color: Colors.white)),
              alignment: Alignment.center,
              child: const Icon(Icons.noise_aware_rounded),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        );
      },
    );
  }
}