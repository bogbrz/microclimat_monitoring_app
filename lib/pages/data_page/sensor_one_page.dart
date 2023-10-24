import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microclimat_monitoring_app/data_source/remote_data_source.dart';
import 'package:microclimat_monitoring_app/datamodel.dart';
import 'package:microclimat_monitoring_app/pages/data_page/cubit/datapage_cubit.dart';
import 'package:microclimat_monitoring_app/repositories/repository.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';

class SensorOnePage extends StatefulWidget {
  const SensorOnePage({
    super.key,
  });

  @override
  State<SensorOnePage> createState() => _SensorOnePageState();
}

class _SensorOnePageState extends State<SensorOnePage> {
  var dayCount = 1.0;
  var sliderMin = 0.0;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocProvider(
          create: (context) => DatapageCubit(Repository(RemoteData()))..start(),
          child: BlocConsumer<DatapageCubit, DatapageState>(
            listener: (context, state) {
              if (state.errorMessage.isNotEmpty ||
                  state.errorMessage == errorMessage) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('something went wrong'),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              final dataModels = state.dataModels;
              double sliderValue =
                  dataModels.isNotEmpty ? dataModels.length.toDouble() : 1.0;
              for (final dataModel in dataModels) {
                dayCount++;
              }
              double sliderMax = dataModels.length.toDouble();
              double chartVisibleMin = sliderValue - 8.0;
              double chartVisibleMax = sliderValue;
              double sliderMin = 0.0;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                        labelAlignment: LabelAlignment.center,
                        interval: 1,
                        visibleMinimum: chartVisibleMax,
                        visibleMaximum: chartVisibleMin,
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
                            color: Colors.red),
                        PlotBand(
                            start: 0,
                            end: 10,
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
                          activationMode: ActivationMode.doubleTap,
                          shouldAlwaysShow: true),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Slider(
                      divisions: 1,
                      min: 0.0,
                      max: 100,
                      value: sliderValue,
                      onChanged: (value) {
                        setState(() {
                          sliderValue = value;
                          chartVisibleMax = sliderValue - 8.0;
                          chartVisibleMin = sliderValue;
                          if (chartVisibleMin < 0) {
                            chartVisibleMax = 8;
                            chartVisibleMin = 0;
                          }
                        });
                      },
                      label: sliderValue.round().toString()),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        int min = 5;
                        int max = 35;
                        Random random = Random();

                        for (int i = 57; i <= 58; i++) {
                          int randomInt = min + random.nextInt(max - min + 1);
                          context
                              .read<DatapageCubit>()
                              .add(day: i, temp: randomInt);
                        }
                      },
                      child: const Text("generate")),
                ],
              );
            },
          ),
        ));
  }
}
