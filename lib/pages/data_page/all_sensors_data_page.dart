import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microclimat_monitoring_app/datamodel.dart';
import 'package:microclimat_monitoring_app/pages/data_page/cubit/datapage_cubit.dart';
import 'package:microclimat_monitoring_app/repository.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AllSensorsData extends StatelessWidget {
  const AllSensorsData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocProvider(
          create: (context) => DatapageCubit(Repository())..start(),
          child: BlocBuilder<DatapageCubit, DatapageState>(
            builder: (context, state) {
              final dataModels = state.dataModels;
              print(dataModels);

              return Center(
                child: SizedBox(
                  height: 300,
                  width: 400,
                  child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: <LineSeries<DataModel, String>>[
                        LineSeries(
                            dataSource: dataModels,
                            xValueMapper: (DataModel data, _) => data.date,
                            yValueMapper: (DataModel temperature, _) =>
                                temperature.temperature)
                      ]),
                ),
              );
            },
          ),
        ));
  }
}
