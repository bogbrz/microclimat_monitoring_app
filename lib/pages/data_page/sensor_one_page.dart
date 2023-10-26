import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microclimat_monitoring_app/data_source/remote_data_source.dart';
import 'package:microclimat_monitoring_app/datamodel.dart';
import 'package:microclimat_monitoring_app/pages/data_page/cubit/datapage_cubit.dart';
import 'package:microclimat_monitoring_app/repositories/repository.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({
    required this.sensorNumber,
    super.key,
  });
  final sensorNumber;

  @override
  State<SensorPage> createState() => _SensorOnePageState();
}

class _SensorOnePageState extends State<SensorPage> {
  var currentTemp = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sensor ${widget.sensorNumber}"),
        ),
        body: BlocProvider(
          create: (context) => DatapageCubit(Repository(RemoteData()))..start(),
          child: BlocConsumer<DatapageCubit, DatapageState>(
            listener: (context, state) {
              if (state.errorMessage.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('${state.errorMessage}'),
                  backgroundColor: Colors.red,
                ));
              }
              final dataModels = state.dataModels;
              for (final dataModel in dataModels) {
                setState(() {
                  currentTemp = dataModel.temperature;
                  print(currentTemp);
                });
              }
            },
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
                        Container(
                          width: (MediaQuery.of(context).size.width) / 3.75,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 37, 20, 20),
                              border:
                                  Border.all(width: 2, color: Colors.white)),
                          alignment: Alignment.center,
                          child: Text('Temperature'),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width) / 3.75,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 148, 145, 145),
                              border:
                                  Border.all(width: 2, color: Colors.white)),
                          alignment: Alignment.center,
                          child: Text('Humidity'),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width) / 3.75,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 148, 145, 145),
                              border:
                                  Border.all(width: 2, color: Colors.white)),
                          alignment: Alignment.center,
                          child: Text('Noise'),
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
                            verticalTextAlignment: TextAnchor.middle,
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
                            verticalTextAlignment: TextAnchor.middle,
                            text: "Critical value",
                            isVisible: true,
                            color: Color.fromARGB(255, 0, 140, 255))
                      ]),
                      series: <LineSeries<DataModel, int>>[
                        LineSeries(
                          color: Colors.black,
                          dataSource: dataModels,
                          xValueMapper: (DataModel date, _) => date.date,
                          yValueMapper: (DataModel temperature, _) =>
                              temperature.temperature,
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
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Column(children: [
                                Text('Current temperature'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('$currentTemp°C')
                              ]),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: Column(children: [
                                Text('Current humidity'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('$currentTemp°C')
                              ]),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: Column(children: [
                                Text('Current noise level'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('$currentTemp°C')
                              ]),
                            )
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
