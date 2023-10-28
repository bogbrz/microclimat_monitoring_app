import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microclimat_monitoring_app/core.dart';
import 'package:microclimat_monitoring_app/data_source/humidity_data_source.dart';
import 'package:microclimat_monitoring_app/data_source/nosie_data_source.dart';
import 'package:microclimat_monitoring_app/data_source/temperature_data_source.dart';
import 'package:microclimat_monitoring_app/datamodel.dart';
import 'package:microclimat_monitoring_app/pages/data_page/cubit/datapage_cubit.dart';
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
  DataModel? lastDataModel;
  // @override
  // void initState() {
  //   super.initState();
  //   colorNotifier.addListener(() {
  //     setState(() {
  //       color = colorNotifier.value;
  //     });
  //   });
  // }

  // var color = null;
  var isPressed1 = false;
  var isPressed2 = false;
  var isPressed3 = false;
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
        body: BlocProvider(
          create: (context) => DatapageCubit(
              TempRepository(TempDataSource()),
              HumidityRepository(HumidityDataSource()),
              NoiseRepository(NoiseDataSource())),
          child: BlocConsumer<DatapageCubit, DatapageState>(
            listener: (context, state) {
              if (state.status == Status.error) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ));
              }
            },

            // if (currentValue > 25 || currentValue < 11) {
            //   colorNotifier.value = Colors.red;
            // } else {
            //   colorNotifier.value = null;
            // }

            builder: (context, state) {
              final dataModels = state.dataModels;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<DatapageCubit>().tempData();
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width) / 3.75,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: isPressed1 ? Colors.blue : Colors.grey,
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            alignment: Alignment.center,
                            child: const Text('Temperature'),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<DatapageCubit>().humidityData();

                            setState(() {
                              isPressed1 = false;
                              isPressed2 = true;
                              isPressed3 = false;
                            });
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width) / 3.75,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: isPressed2 ? Colors.blue : Colors.grey,
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            alignment: Alignment.center,
                            child: const Text('Humidity'),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<DatapageCubit>().noiseData();
                            isPressed1 = false;
                            isPressed2 = false;
                            isPressed3 = true;
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width) / 3.75,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: isPressed3 ? Colors.blue : Colors.grey,
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            alignment: Alignment.center,
                            child: const Text('Noise'),
                          ),
                        )
                      ],
                    ),
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
                            color: const Color.fromARGB(255, 0, 140, 255))
                      ]),
                      series: <LineSeries<DataModel, int>>[
                        LineSeries(
                          color: Colors.black,
                          dataSource: dataModels,
                          xValueMapper: (DataModel date, _) => date.hour,
                          yValueMapper: (DataModel temperature, _) =>
                              temperature.value,
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: (MediaQuery.of(context).size.width) /
                                      3.75,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 37, 20, 20),
                                      border: Border.all(
                                          width: 2, color: Colors.white)),
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
                                      Text('${state.currentValue}')
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: (MediaQuery.of(context).size.width) /
                                      3.75,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 37, 20, 20),
                                      border: Border.all(
                                          width: 2, color: Colors.white)),
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
                                      Text('${state.averageValue}°C')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: (MediaQuery.of(context).size.width) /
                                      3.75,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 37, 20, 20),
                                      border: Border.all(
                                          width: 2, color: Colors.white)),
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Current humidity:',
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text('${state.currentValue} °C')
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: (MediaQuery.of(context).size.width) /
                                      3.75,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 37, 20, 20),
                                      border: Border.all(
                                          width: 2, color: Colors.white)),
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
                                      Text('${state.averageValue}°C')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: (MediaQuery.of(context).size.width) /
                                      3.75,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 37, 20, 20),
                                      border: Border.all(
                                          width: 2, color: Colors.white)),
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Current noise:',
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text('${state.currentValue} °C')
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: (MediaQuery.of(context).size.width) /
                                      3.75,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 37, 20, 20),
                                      border: Border.all(
                                          width: 2, color: Colors.white)),
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
                                      Text('${state.averageValue}°C')
                                    ],
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
          ),
        ));
  }
}
