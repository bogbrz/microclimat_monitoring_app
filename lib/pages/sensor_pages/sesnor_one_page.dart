import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microclimat_monitoring_app/core.dart';
import 'package:microclimat_monitoring_app/cubit/humidity_data_cubit.dart';
import 'package:microclimat_monitoring_app/cubit/noise_data_cubit.dart';
import 'package:microclimat_monitoring_app/cubit/temp_data_cubit.dart';
import 'package:microclimat_monitoring_app/data_source/humidity_data_source.dart';
import 'package:microclimat_monitoring_app/data_source/nosie_data_source.dart';
import 'package:microclimat_monitoring_app/data_source/temperature_data_source.dart';
import 'package:microclimat_monitoring_app/models/humidity_model.dart';
import 'package:microclimat_monitoring_app/models/noise_model.dart';
import 'package:microclimat_monitoring_app/models/temp_model.dart';

import 'package:microclimat_monitoring_app/repositories/humi_repository.dart';
import 'package:microclimat_monitoring_app/repositories/nosie_repository.dart';
import 'package:microclimat_monitoring_app/repositories/temp_repository.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({
    required this.sensorNumber,
    super.key,
  });
  final int sensorNumber;

  @override
  State<SensorPage> createState() => _SensorOnePageState();
}

class _SensorOnePageState extends State<SensorPage> {
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
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SensorPage(
                          sensorNumber: widget.sensorNumber,
                        ),
                      ),
                    );
                  },
                  child: const Icon(Icons.refresh)),
            )
          ],
          title: Text("Sensor ${widget.sensorNumber}"),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => TempDataCubit(
                TempRepository(TempDataSource())..getTempDataModel(),
              ),
            ),
            BlocProvider(
              create: (context) => HumidityDataCubit(
                HumidityRepository(HumidityDataSource())
                  ..getHumidityDataModel(),
              ),
            ),
            BlocProvider(
              create: (context) => NoiseDataCubit(
                  NoiseRepository(NoiseDataSource())..getNoiseDataModel()),
            ),
          ],
          child: BlocListener<TempDataCubit, TempDataState>(
              listener: (context, state) {
            if (state.status == Status.error) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ));
            }
            // if (state.status == Status.isPressed) {
            //   color = const Color.fromARGB(255, 37, 20, 20);
            // } else {
            //   color = Colors.grey;
            // }
          }, child: BlocBuilder<TempDataCubit, TempDataState>(
            builder: (context, state) {
              final tempModels = state.tempModels;
              final currentTemp = state.currentTemp;
              final averageTemp = state.averagetemp;
              return BlocBuilder<NoiseDataCubit, NoiseDataState>(
                builder: (context, state) {
                  final noiseModels = state.noiseModels;
                  final currentNoise = state.currentNoise;
                  final averageNoise = state.averageNoise;
                  return BlocBuilder<HumidityDataCubit, HumidityDataState>(
                    builder: (context, state) {
                      final humidityModels = state.humidityModel;
                      final currentHumidity = state.currentHumidity;
                      final averageHumidity = state.currentHumidity;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      context.read<TempDataCubit>().tempData();

                                      isPressed1 = true;
                                      isPressed2 = false;
                                      isPressed3 = false;
                                    },
                                    child: Container(
                                      width:
                                          (MediaQuery.of(context).size.width) /
                                              3.75,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: isPressed1
                                              ? const Color.fromARGB(
                                                  255, 37, 20, 20)
                                              : Colors.grey,
                                          border: Border.all(
                                              width: 2, color: Colors.white)),
                                      alignment: Alignment.center,
                                      child: const Text('Temperature'),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      context
                                          .read<HumidityDataCubit>()
                                          .humidityData();

                                      isPressed1 = false;
                                      isPressed2 = true;
                                      isPressed3 = false;
                                    },
                                    child: Container(
                                      width:
                                          (MediaQuery.of(context).size.width) /
                                              3.75,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: isPressed2
                                              ? const Color.fromARGB(
                                                  255, 37, 20, 20)
                                              : Colors.grey,
                                          border: Border.all(
                                              width: 2, color: Colors.white)),
                                      alignment: Alignment.center,
                                      child: const Text('Humidity'),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      context
                                          .read<NoiseDataCubit>()
                                          .noiseData();

                                      isPressed1 = false;
                                      isPressed2 = false;
                                      isPressed3 = true;
                                    },
                                    child: Container(
                                      width:
                                          (MediaQuery.of(context).size.width) /
                                              3.75,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: isPressed3
                                              ? const Color.fromARGB(
                                                  255, 37, 20, 20)
                                              : Colors.grey,
                                          border: Border.all(
                                              width: 2, color: Colors.white)),
                                      alignment: Alignment.center,
                                      child: const Text('Noise'),
                                    ),
                                  )
                                ]),
                          ),
                          SizedBox(
                            height: 300,
                            width: double.infinity,
                            child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(
                                labelAlignment: LabelAlignment.center,
                                interval: 1,
                                visibleMinimum: 1,
                                visibleMaximum: 8,
                                isInversed: false,
                              ),
                              primaryYAxis: NumericAxis(plotBands: <PlotBand>[
                                PlotBand(
                                    isVisible: true,
                                    verticalTextPadding: '5',
                                    horizontalTextPadding: '5',
                                    horizontalTextAlignment: TextAnchor.middle,
                                    verticalTextAlignment: TextAnchor.start,
                                    text: "Critical value",
                                    start: 25,
                                    end: 26,
                                    color: Colors.red),
                                PlotBand(
                                    start: 10,
                                    end: 11,
                                    verticalTextPadding: '5',
                                    horizontalTextPadding: '5',
                                    horizontalTextAlignment: TextAnchor.middle,
                                    verticalTextAlignment: TextAnchor.start,
                                    text: "Critical value",
                                    isVisible: true,
                                    color:
                                        const Color.fromARGB(255, 0, 140, 255))
                              ]),
                              series: isPressed1
                                  ? <LineSeries<TempModel, int>>[
                                      LineSeries(
                                        color: Colors.black,
                                        dataSource: tempModels,
                                        xValueMapper: (TempModel date, _) =>
                                            date.hour,
                                        yValueMapper:
                                            (TempModel temperature, _) =>
                                                temperature.temp,
                                      ),
                                    ]
                                  : isPressed2
                                      ? <LineSeries<HumidityModel, int>>[
                                          LineSeries(
                                            color: Colors.black,
                                            dataSource: humidityModels,
                                            xValueMapper:
                                                (HumidityModel date, _) =>
                                                    date.hour,
                                            yValueMapper:
                                                (HumidityModel humidity, _) =>
                                                    humidity.humidity,
                                          ),
                                        ]
                                      : <LineSeries<NoiseModel, int>>[
                                          LineSeries(
                                            color: Colors.black,
                                            dataSource: noiseModels,
                                            xValueMapper:
                                                (NoiseModel date, _) =>
                                                    date.hour,
                                            yValueMapper:
                                                (NoiseModel noise, _) =>
                                                    noise.noise,
                                          ),
                                        ],
                              zoomPanBehavior: ZoomPanBehavior(
                                  enablePinching: false, enablePanning: true),
                              trackballBehavior: TrackballBehavior(
                                  enable: true,
                                  activationMode: ActivationMode.singleTap,
                                  shouldAlwaysShow: true),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width) /
                                              3.75,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 37, 20, 20),
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.white)),
                                          alignment: Alignment.center,
                                          child: Column(
                                            children: [
                                              const Text(
                                                'Current temperature:',
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text('$currentTemp°C')
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width) /
                                              3.75,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 37, 20, 20),
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.white)),
                                          alignment: Alignment.center,
                                          child: Column(
                                            children: [
                                              const Text(
                                                'Average temperature:',
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text('$averageTemp°C')
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width) /
                                              3.75,
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 37, 20, 20),
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.white)),
                                          alignment: Alignment.center,
                                          child: Expanded(
                                            child: Column(
                                              children: [
                                                const Text(
                                                  'Current humidity:',
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text('$currentHumidity °C')
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width) /
                                              3.75,
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: state.colorBox,
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.white)),
                                          alignment: Alignment.center,
                                          child: Expanded(
                                            child: Column(
                                              children: [
                                                const Text(
                                                  'Average humidity:',
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text('$averageHumidity°C')
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width) /
                                              3.75,
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 37, 20, 20),
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.white)),
                                          alignment: Alignment.center,
                                          child: Expanded(
                                            child: Column(
                                              children: [
                                                const Text(
                                                  'Current noise:',
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text('$currentNoise °C')
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width) /
                                              3.75,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 37, 20, 20),
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.white)),
                                          alignment: Alignment.center,
                                          child: Expanded(
                                            child: Column(
                                              children: [
                                                const Text(
                                                  'Average noise:',
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text('$averageNoise°C')
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
              );
            },
          )),
        ));
  }
}
