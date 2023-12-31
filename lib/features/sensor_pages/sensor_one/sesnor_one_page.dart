import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_one_cubit/cubit/sensor_one_cubit.dart';
import 'package:microclimat_monitoring_app/domain/models/sensor_model.dart';
import 'package:microclimat_monitoring_app/features/sensor_pages/sensor_one/sensor_one_settings.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SensorPage extends StatefulWidget {
  SensorPage({
    required this.sensorNumber,
    super.key,
  });
  final int sensorNumber;

  @override
  State<SensorPage> createState() => _SensorOnePageState();
}

class _SensorOnePageState extends State<SensorPage> {
  Color color = Colors.grey;
  bool isPressed1 = true;
  bool isPressed2 = false;
  bool isPressed3 = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SensorOneCubit, SensorOneState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Sensor ${widget.sensorNumber}"),
              actions: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => SensorOneSettings()),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(Icons.settings),
                    ))
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {});
                            isPressed1 = true;
                            isPressed2 = false;
                            isPressed3 = false;
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width) / 3.5,
                            height: (MediaQuery.of(context).size.height) / 15,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: isPressed1
                                    ? const Color.fromARGB(255, 37, 20, 20)
                                    : Colors.grey,
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            alignment: Alignment.center,
                            child: const Text('Temperature'),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {});
                            isPressed1 = false;
                            isPressed2 = true;
                            isPressed3 = false;
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width) / 3.5,
                            height: (MediaQuery.of(context).size.height) / 15,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: isPressed2
                                    ? const Color.fromARGB(255, 37, 20, 20)
                                    : Colors.grey,
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            alignment: Alignment.center,
                            child: const Text('Humidity'),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {});
                            isPressed1 = false;
                            isPressed2 = false;
                            isPressed3 = true;
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width) / 3.5,
                            height: (MediaQuery.of(context).size.height) / 15,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: isPressed3
                                    ? const Color.fromARGB(255, 37, 20, 20)
                                    : Colors.grey,
                                border:
                                    Border.all(width: 2, color: Colors.white)),
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
                          start: 24,
                          end: 25,
                          color: Colors.red),
                      PlotBand(
                          start: 14,
                          end: 15,
                          verticalTextPadding: '5',
                          horizontalTextPadding: '5',
                          horizontalTextAlignment: TextAnchor.middle,
                          verticalTextAlignment: TextAnchor.start,
                          text: "Critical value",
                          isVisible: true,
                          color: const Color.fromARGB(255, 0, 140, 255))
                    ]),
                    series: <LineSeries<SensorModel, int>>[
                      LineSeries(
                        color: Colors.black,
                        dataSource: state.sensorOneModels,
                        xValueMapper: (SensorModel date, _) => date.hour,
                        yValueMapper: (SensorModel data, _) => isPressed1
                            ? data.temp
                            : isPressed2
                                ? data.humidity
                                : data.noise,
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
                                width:
                                    (MediaQuery.of(context).size.width) / 3.2,
                                height:
                                    (MediaQuery.of(context).size.height) / 9,
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
                                    Text('${state.currentTemp}°C')
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width) / 3.2,
                                height:
                                    (MediaQuery.of(context).size.height) / 9,
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
                                    Text('${state.averageTemp}°C')
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width) / 3.2,
                                height:
                                    (MediaQuery.of(context).size.height) / 9,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 37, 20, 20),
                                    border: Border.all(
                                        width: 2, color: Colors.white)),
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
                                      Text('${state.currentHumidity}%')
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width) / 3.2,
                                height:
                                    (MediaQuery.of(context).size.height) / 9,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 37, 20, 20),
                                    border: Border.all(
                                        width: 2, color: Colors.white)),
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
                                      Text('${state.averageHumidity}%')
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width) / 3.2,
                                height:
                                    (MediaQuery.of(context).size.height) / 9,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 37, 20, 20),
                                    border: Border.all(
                                        width: 2, color: Colors.white)),
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
                                      Text('${state.currentNoise}dB')
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width) / 3.2,
                                height:
                                    (MediaQuery.of(context).size.height) / 9,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 37, 20, 20),
                                    border: Border.all(
                                        width: 2, color: Colors.white)),
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
                                      Text('${state.averageNoise}dB')
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
            ));
      },
    );
  }
}
