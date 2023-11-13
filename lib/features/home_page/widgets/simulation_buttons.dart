import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microclimat_monitoring_app/app/injection/injection_container.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_five_cubit/cubit/sensor_five_cubit.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_four_cubit/cubit/sensor_four_cubit.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_one_cubit/cubit/sensor_one_cubit.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_three_cubit/cubit/sensor_three_cubit.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_two_cubit/cubit/sensor_two_cubit.dart';

class GeneratorFiveWidget extends StatelessWidget {
  const GeneratorFiveWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SensorFiveCubit, SensorFiveState>(
      builder: (context, state) {
        return Column(
          children: [
            const Text(
              "Generate 5",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                getIt<SensorFiveCubit>().addDataFive();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                height: 40,
                width: 40,
                child: const Icon(Icons.add),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Remove",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                height: 40,
                width: 40,
                child: const Icon(Icons.delete),
              ),
            ),
          ],
        );
      },
    );
  }
}

class GeneratorFourWidget extends StatelessWidget {
  const GeneratorFourWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SensorFourCubit, SensorFourState>(
      builder: (context, state) {
        return Column(
          children: [
            const Text(
              "Generate 4",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                getIt<SensorFourCubit>().addDataFour();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                height: 40,
                width: 40,
                child: const Icon(Icons.add),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Remove",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                context.read<SensorFourCubit>().removeGeneratedData();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                height: 40,
                width: 40,
                child: const Icon(Icons.delete),
              ),
            ),
          ],
        );
      },
    );
  }
}

class GeneratorThreeWidget extends StatelessWidget {
  const GeneratorThreeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SensorThreeCubit, SensorThreeState>(
      builder: (context, state) {
        return Column(
          children: [
            const Text(
              "Generate 3",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                getIt<SensorThreeCubit>().addDataThree();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                height: 40,
                width: 40,
                child: const Icon(Icons.add),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Remove",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                context.read<SensorThreeCubit>().removeGeneratedData();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                height: 40,
                width: 40,
                child: const Icon(Icons.delete),
              ),
            ),
          ],
        );
      },
    );
  }
}

class GeneratorTwoWidget extends StatelessWidget {
  const GeneratorTwoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SensorTwoCubit, SensorTwoState>(
      builder: (context, state) {
        return Column(
          children: [
            const Text(
              "Generate 2",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                getIt<SensorTwoCubit>().addDataTwo();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                height: 40,
                width: 40,
                child: const Icon(Icons.add),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Remove",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                context.read<SensorTwoCubit>().removeGeneratedData();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                height: 40,
                width: 40,
                child: const Icon(Icons.delete),
              ),
            ),
          ],
        );
      },
    );
  }
}

class GeneratorOneWidget extends StatelessWidget {
  const GeneratorOneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Generate 1",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            getIt<SensorOneCubit>().addDataOne();
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
            ),
            height: 40,
            width: 40,
            child: const Icon(Icons.add),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Remove",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            context.read<SensorOneCubit>().removeGeneratedData();
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
            ),
            height: 40,
            width: 40,
            child: const Icon(Icons.delete),
          ),
        ),
      ],
    );
  }
}
