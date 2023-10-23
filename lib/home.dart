import 'package:flutter/material.dart';
import 'package:microclimat_monitoring_app/pages/data_page/sensor_one_page.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page '),
        centerTitle: true,
      ),
      body: Column(
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
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SensorOnePage(),
                      ),
                    ),
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
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SensorTwoPage(),
                      ),
                    ),
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
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SensorThreePage(),
                      ),
                    ),
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
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SensorFourPage(),
                      ),
                    ),
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
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SensorFivePage(),
                      ),
                    ),
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
        ],
      ),
    );
  }
}

class SensorFivePage extends StatelessWidget {
  const SensorFivePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text(' sensor 4')),
    );
  }
}

class SensorFourPage extends StatelessWidget {
  const SensorFourPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('sensor 4')),
    );
  }
}

class SensorThreePage extends StatelessWidget {
  const SensorThreePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('sensor 3')),
    );
  }
}

class SensorTwoPage extends StatelessWidget {
  const SensorTwoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('sensor 2')),
    );
  }
}
