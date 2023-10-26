import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microclimat_monitoring_app/data_source/remote_data_source.dart';
import 'package:microclimat_monitoring_app/pages/data_page/cubit/datapage_cubit.dart';
import 'package:microclimat_monitoring_app/pages/data_page/sensor_one_page.dart';
import 'package:microclimat_monitoring_app/repositories/repository.dart';

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
      body: BlocProvider(
        create: (context) => DatapageCubit(Repository(RemoteData())),
        child: BlocBuilder<DatapageCubit, DatapageState>(
          builder: (context, state) {
            return Column(
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => SensorPage(
                                        sensorNumber: sensorNumber,
                                      )),
                            );

                            setState(() {
                              sensorNumber = 1;
                            });
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => SensorPage(
                                        sensorNumber: sensorNumber,
                                      )),
                            );
                            setState(() {
                              sensorNumber = 2;
                            });
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return SensorPage(
                                    sensorNumber: sensorNumber,
                                  );
                                },
                              ),
                            );
                            setState(() {
                              sensorNumber = 3;
                            });
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return SensorPage(
                                    sensorNumber: sensorNumber,
                                  );
                                },
                              ),
                            );

                            setState(() {
                              sensorNumber = 4;
                            });
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return SensorPage(
                                    sensorNumber: sensorNumber,
                                  );
                                },
                              ),
                            );
                            setState(() {
                              sensorNumber = 5;
                            });
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
                ElevatedButton(
                    onPressed: () {
                      context.read<DatapageCubit>().loop();
                    },
                    child: const Text("generate")),
              ],
            );
          },
        ),
      ),
    );
  }
}
