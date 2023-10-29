import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microclimat_monitoring_app/data_source/humidity_data_source.dart';
import 'package:microclimat_monitoring_app/data_source/nosie_data_source.dart';
import 'package:microclimat_monitoring_app/data_source/temperature_data_source.dart';

import 'package:microclimat_monitoring_app/pages/sensor_pages/cubit/humidity_data_cubit.dart';
import 'package:microclimat_monitoring_app/pages/sensor_pages/cubit/noise_data_cubit.dart';
import 'package:microclimat_monitoring_app/pages/sensor_pages/cubit/temp_data_cubit.dart';
import 'package:microclimat_monitoring_app/pages/sensor_pages/sensor_five_page.dart';
import 'package:microclimat_monitoring_app/pages/sensor_pages/sensor_four_page.dart';
import 'package:microclimat_monitoring_app/pages/sensor_pages/sensor_two_page.dart';
import 'package:microclimat_monitoring_app/pages/sensor_pages/sesnor_one_page.dart';
import 'package:microclimat_monitoring_app/pages/sensor_pages/sesnor_three_page.dart';
import 'package:microclimat_monitoring_app/repositories/humi_repository.dart';
import 'package:microclimat_monitoring_app/repositories/nosie_repository.dart';
import 'package:microclimat_monitoring_app/repositories/temp_repository.dart';

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
      body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => TempDataCubit(
                TempRepository(TempDataSource()),
              ),
            ),
            BlocProvider(
              create: (context) =>
                  NoiseDataCubit(NoiseRepository(NoiseDataSource())),
            ),
            BlocProvider(
              create: (context) =>
                  HumidityDataCubit(HumidityRepository(HumidityDataSource())),
            ),
          ],
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: <Widget>[
                    const Image(
                      image: AssetImage(
                        'images/schemat.png',
                      ),
                    ),
                    Positioned(
                      left: 80, //X-Posistion
                      top: 107.5, //Y-Position
                      child: InkWell(
                        onTap: () {
                          sensorNumber = 1;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => SensorPage(
                                      sensorNumber: sensorNumber,
                                    )),
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
                      right: 45, //X-Posistion
                      top: 107.5, //Y-Position
                      child: InkWell(
                        onTap: () {
                          sensorNumber = 2;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => SensorPage2(
                                      sensorNumber: sensorNumber,
                                    )),
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
                      left: 171, //X-Posistion
                      bottom: 220, //Y-Position
                      child: InkWell(
                        onTap: () {
                          sensorNumber = 3;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return SensorPage3(
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
                      left: 171, //X-Posistion
                      bottom: 107.5, //Y-Position
                      child: InkWell(
                        onTap: () {
                          sensorNumber = 4;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return SensorPage4(
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
                      left: 30, //X-Posistion
                      bottom: 55, //Y-Position
                      child: InkWell(
                        onTap: () {
                          sensorNumber = 5;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return SensorPage5(
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
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocBuilder<TempDataCubit, TempDataState>(
                            builder: (context, state) {
                              return Expanded(
                                child: Column(children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<TempDataCubit>()
                                            .generateTemp();
                                      },
                                      child: const Text(
                                        "generate temp",
                                        textAlign: TextAlign.center,
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<TempDataCubit>()
                                            .generateTemp2();
                                      },
                                      child: const Text(
                                        "generate temp2",
                                        textAlign: TextAlign.center,
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<TempDataCubit>()
                                            .generateTemp3();
                                      },
                                      child: const Text(
                                        "generate temp3",
                                        textAlign: TextAlign.center,
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<TempDataCubit>()
                                            .generateTemp4();
                                      },
                                      child: const Text(
                                        "generate temp4",
                                        textAlign: TextAlign.center,
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<TempDataCubit>()
                                            .generateTemp5();
                                      },
                                      child: const Text(
                                        "generate temp5",
                                        textAlign: TextAlign.center,
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ]),
                              );
                            },
                          ),
                          BlocBuilder<HumidityDataCubit, HumidityDataState>(
                            builder: (context, state) {
                              return Expanded(
                                child: Column(children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<HumidityDataCubit>()
                                            .generateHumidity();
                                      },
                                      child: const Text(
                                        "generate humidity",
                                        textAlign: TextAlign.center,
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<HumidityDataCubit>()
                                            .generateHumidity2();
                                      },
                                      child: const Text(
                                        "generate humidity2",
                                        textAlign: TextAlign.center,
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<HumidityDataCubit>()
                                            .generateHumidity3();
                                      },
                                      child: const Text(
                                        "generate humidity3",
                                        textAlign: TextAlign.center,
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<HumidityDataCubit>()
                                            .generateHumidity4();
                                      },
                                      child: const Text(
                                        "generate humidity4",
                                        textAlign: TextAlign.center,
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<HumidityDataCubit>()
                                            .generateHumidity5();
                                      },
                                      child: const Text(
                                        "generate humidity5",
                                        textAlign: TextAlign.center,
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ]),
                              );
                            },
                          ),
                          BlocBuilder<NoiseDataCubit, NoiseDataState>(
                            builder: (context, state) {
                              return Expanded(
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          context
                                              .read<NoiseDataCubit>()
                                              .generateNoise();
                                        },
                                        child: const Text(
                                          "generate noise",
                                          textAlign: TextAlign.center,
                                        )),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          context
                                              .read<NoiseDataCubit>()
                                              .generateNoise2();
                                        },
                                        child: const Text(
                                          "generate noise2",
                                          textAlign: TextAlign.center,
                                        )),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          context
                                              .read<NoiseDataCubit>()
                                              .generateNoise3();
                                        },
                                        child: const Text(
                                          "generate noise3",
                                          textAlign: TextAlign.center,
                                        )),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          context
                                              .read<NoiseDataCubit>()
                                              .generateNoise4();
                                        },
                                        child: const Text(
                                          "generate noise4",
                                          textAlign: TextAlign.center,
                                        )),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          context
                                              .read<NoiseDataCubit>()
                                              .generateNoise5();
                                        },
                                        child: const Text(
                                          "generate noise5",
                                          textAlign: TextAlign.center,
                                        )),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
