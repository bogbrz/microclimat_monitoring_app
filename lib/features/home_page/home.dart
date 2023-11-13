import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_five_cubit/cubit/sensor_five_cubit.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_four_cubit/cubit/sensor_four_cubit.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_one_cubit/cubit/sensor_one_cubit.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_three_cubit/cubit/sensor_three_cubit.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_two_cubit/cubit/sensor_two_cubit.dart';
import 'package:microclimat_monitoring_app/features/sensor_pages/sensor_five/sensor_five_page.dart';
import 'package:microclimat_monitoring_app/features/sensor_pages/sensor_four/sensor_four_page.dart';
import 'package:microclimat_monitoring_app/features/sensor_pages/sensor_one/sesnor_one_page.dart';
import 'package:microclimat_monitoring_app/features/sensor_pages/sensor_three/sesnor_three_page.dart';
import 'package:microclimat_monitoring_app/features/sensor_pages/sensor_two/sensor_two_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const sensorHeigt = 20.0;
    const sensorWidth = 20.0;
    var sensorNumber = 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page '),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height) / 2,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white)),
            child: Center(
              child: Stack(
                children: <Widget>[
                  const Image(
                    image: AssetImage(
                      'images/schemat.png',
                    ),
                  ),
                  Positioned(
                    left: 45, //X-Posistion
                    top: 60, //Y-Position
                    child: InkWell(
                      onTap: () {
                        sensorNumber = 1;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SensorPage(
                              sensorNumber: sensorNumber,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pink,
                        ),
                        width: sensorWidth,
                        height: sensorHeigt,
                        child: const Padding(
                          padding: EdgeInsets.all(1.0),
                          child: Text('1'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 171, //X-Posistion
                    bottom: 200, //Y-Position
                    child: InkWell(
                      onTap: () {
                        sensorNumber = 2;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SensorTwoPage(
                              sensorNumber: sensorNumber,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pink,
                        ),
                        width: sensorWidth,
                        height: sensorHeigt,
                        child: const Text('2'),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100, //X-Posistion
                    bottom: 130, //Y-Position
                    child: InkWell(
                      onTap: () {
                        sensorNumber = 3;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return SensorThreePage(
                                sensorNumber: sensorNumber,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pink,
                        ),
                        width: sensorWidth,
                        height: sensorHeigt,
                        child: const Text('3'),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 98, //X-Posistion
                    bottom: 62, //Y-Position
                    child: InkWell(
                      onTap: () {
                        sensorNumber = 4;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return SensorFourPage(
                                sensorNumber: sensorNumber,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pink,
                        ),
                        width: sensorWidth,
                        height: sensorHeigt,
                        child: const Text(
                          '4',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20, //X-Posistion
                    bottom: 30, //Y-Position
                    child: InkWell(
                      onTap: () {
                        sensorNumber = 5;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return SensorFivePage(
                                sensorNumber: sensorNumber,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pink,
                        ),
                        width: sensorWidth,
                        height: sensorHeigt,
                        child: const Text('5'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Sensors",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          SensorOneStatus(),
                          SizedBox(
                            width: 8,
                          ),
                          SensorTwoStatus(),
                          SizedBox(
                            width: 8,
                          ),
                          SensorThreeStatus(),
                          SizedBox(
                            width: 8,
                          ),
                          SensorFourStatus(),
                          SizedBox(
                            width: 8,
                          ),
                          SensorFiveStatus(),
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    "Test generators",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        GeneratorOneWidget(),
                        SizedBox(
                          width: 8,
                        ),
                        GeneratorTwoWidget(),
                        SizedBox(
                          width: 8,
                        ),
                        GeneratorThreeWidget(),
                        SizedBox(
                          width: 8,
                        ),
                        GeneratorFourWidget(),
                        SizedBox(
                          width: 8,
                        ),
                        GeneratorFiveWidget(),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
                context.read<SensorFiveCubit>().addDataFive();
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
                context.read<SensorFiveCubit>().removeGeneratedData();
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
                context.read<SensorFourCubit>().addDataFour();
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
                context.read<SensorThreeCubit>().addDataThree();
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
                context.read<SensorTwoCubit>().addDataTwo();
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
    return BlocBuilder<SensorOneCubit, SensorOneState>(
      builder: (context, state) {
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
                context.read<SensorOneCubit>().addDataOne();
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
      },
    );
  }
}

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
