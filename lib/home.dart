import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microclimat_monitoring_app/data_source/sensor_five_data_source.dart';
import 'package:microclimat_monitoring_app/data_source/sensor_four_data_source.dart';
import 'package:microclimat_monitoring_app/data_source/sensor_one_data_source.dart';
import 'package:microclimat_monitoring_app/data_source/sensor_three_data_source.dart';
import 'package:microclimat_monitoring_app/data_source/sensor_two_data_source.dart';
import 'package:microclimat_monitoring_app/pages/sensor_pages/sensor_five/cubit/sensor_five_cubit.dart';
import 'package:microclimat_monitoring_app/pages/sensor_pages/sensor_five/sensor_five_page.dart';
import 'package:microclimat_monitoring_app/pages/sensor_pages/sensor_four/cubit/sensor_four_cubit.dart';
import 'package:microclimat_monitoring_app/pages/sensor_pages/sensor_four/sensor_four_page.dart';
import 'package:microclimat_monitoring_app/pages/sensor_pages/sensor_one/cubit/sensor_one_cubit.dart';
import 'package:microclimat_monitoring_app/pages/sensor_pages/sensor_one/sesnor_one_page.dart';
import 'package:microclimat_monitoring_app/pages/sensor_pages/sensor_three/cubit/sensor_three_cubit.dart';
import 'package:microclimat_monitoring_app/pages/sensor_pages/sensor_three/sesnor_three_page.dart';
import 'package:microclimat_monitoring_app/pages/sensor_pages/sensor_two/cubit/sensor_two_cubit.dart';
import 'package:microclimat_monitoring_app/pages/sensor_pages/sensor_two/sensor_two_page.dart';
import 'package:microclimat_monitoring_app/repositories/sensor_five_repository.dart';
import 'package:microclimat_monitoring_app/repositories/sensor_four_repository.dart';

import 'package:microclimat_monitoring_app/repositories/sensor_one_repository.dart';
import 'package:microclimat_monitoring_app/repositories/sensor_three_repository.dart';
import 'package:microclimat_monitoring_app/repositories/sensor_two_repository.dart';

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

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SensorOneCubit(
                sensorOneRepository: SensorOneRepository(
                    sensorOneDataSource: SensorOneDataSource()))
              ..start(),
          ),
          BlocProvider(
            create: (context) => SensorTwoCubit(
                sensorTwoRepository: SensorTwoRepository(
                    sensorTwoDataSource: SensorTwoDataSource()))
              ..start(),
          ),
          BlocProvider(
            create: (context) => SensorThreeCubit(
                sensorThreeRepository: SensorThreeRepository(
                    sensorThreeDataSource: SensorThreeDataSource()))
              ..start(),
          ),
          BlocProvider(
            create: (context) => SensorFourCubit(
                sensorFourRepository: SensorFourRepository(
                    sensorFourDataSource: SensorFourDataSource()))
              ..start(),
          ),
          BlocProvider(
            create: (context) => SensorFiveCubit(
                sensorFiveRepository: SensorFiveRepository(
                    sensorFiveDataSource: SensorFiveDataSource()))
              ..start(),
          ),
        ],
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Home Page '),
              centerTitle: true,
            ),
            body: Column(children: [
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
              const SizedBox(
                height: 10,
              ),
              const StatusLists()
            ])

            //   },
            // ),
            )
        //   },
        // );
        );
  }
}

class StatusLists extends StatelessWidget {
  const StatusLists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SensorOneStatus(),
                SensorTwoStatus(),
                SensorThreeStatus(),
                SensorFourStatus(),
                SensorFiveStatus()
              ],
            ),
          )
        ],
      ),
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
            const Text("Temperature", style: TextStyle(fontSize: 10)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.buttonColor1,
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
                  color: state.buttonColor2,
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
                  color: state.buttonColor3,
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
            const Text("Temperature", style: TextStyle(fontSize: 10)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.buttonColor1,
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
                  color: state.buttonColor2,
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
                  color: state.buttonColor3,
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
            const Text("Temperature", style: TextStyle(fontSize: 10)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.buttonColor1,
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
                  color: state.buttonColor2,
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
                  color: state.buttonColor3,
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
            const Text("Temperature", style: TextStyle(fontSize: 10)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.buttonColor1,
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
                  color: state.buttonColor2,
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
                  color: state.buttonColor3,
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
            const Text("Temperature", style: TextStyle(fontSize: 10)),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: state.buttonColor1,
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
                  color: state.buttonColor2,
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
                  color: state.buttonColor3,
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
