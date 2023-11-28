import 'package:flutter/material.dart';
import 'package:microclimat_monitoring_app/features/home_page/widgets/simulation_buttons.dart';
import 'package:microclimat_monitoring_app/features/home_page/widgets/status_buttons.dart';
import 'package:microclimat_monitoring_app/features/sensor_pages/sensor_five/sensor_five_page.dart';
import 'package:microclimat_monitoring_app/features/sensor_pages/sensor_four/sensor_four_page.dart';
import 'package:microclimat_monitoring_app/features/sensor_pages/sensor_one/sesnor_one_page.dart';
import 'package:microclimat_monitoring_app/features/sensor_pages/sensor_three/sesnor_three_page.dart';
import 'package:microclimat_monitoring_app/features/sensor_pages/sensor_two/sensor_two_page.dart';

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
        backgroundColor: Colors.black38,
      ),
      body: Column(
        children: [
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
          Expanded(
            child: ListView(
              children: const [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Sensors",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          SensorOneStatus(),
                          SizedBox(
                            width: 8,
                          ),
                          SensorTwoStatus(),
                          SizedBox(
                            width: 8,
                          ),
                          SensorThreeStatus(),
                          SizedBox(
                            width: 8,
                          ),
                          SensorFourStatus(),
                          SizedBox(
                            width: 8,
                          ),
                          SensorFiveStatus(),
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(children: [
                  Text(
                    "Test generators",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Center(child: GeneratorOneWidget( )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
