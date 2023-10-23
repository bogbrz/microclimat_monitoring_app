import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microclimat_monitoring_app/data_source/remote_data_source.dart';
import 'package:microclimat_monitoring_app/datamodel.dart';
import 'package:microclimat_monitoring_app/pages/data_page/cubit/datapage_cubit.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SensorOnePage extends StatefulWidget {
  const SensorOnePage({
    super.key,
  });

  @override
  State<SensorOnePage> createState() => _SensorOnePageState();
}

class _SensorOnePageState extends State<SensorOnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocProvider(
          create: (context) => DatapageCubit(RemoteData())..start(),
          child: BlocBuilder<DatapageCubit, DatapageState>(
            builder: (context, state) {
              final dataModels = state.dataModels;

              return Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 300,
                      width: 400,
                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(
                            labelIntersectAction:
                                AxisLabelIntersectAction.rotate45,
                            labelAlignment: LabelAlignment.center),
                        series: <LineSeries<DataModel, int>>[
                          LineSeries(
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
                  ),
                  ElevatedButton(
                      onPressed: () {
                        for (int i = 11; i < 24; i++) {
                          context.read<DatapageCubit>().add(i, i);
                        }
                      },
                      child: const Text("generate")),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              );
            },
          ),
        ));
  }
}
