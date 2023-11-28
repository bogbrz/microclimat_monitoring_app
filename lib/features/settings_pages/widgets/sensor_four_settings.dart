import 'package:flutter/material.dart';

class SensorFourSettings extends StatelessWidget {
  const SensorFourSettings({
    super.key,
 required this.temp4Max,
    required this.temp4Min,
    required this.humidity4Max,
    required this.humidity4Min,
    required this.noise4Min,
    required this.noise4Max,
  });

  final TextEditingController? temp4Min;
  final TextEditingController? temp4Max;
  final TextEditingController? humidity4Min;
  final TextEditingController? humidity4Max;
  final TextEditingController? noise4Min;
  final TextEditingController? noise4Max;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
            "Sensor 4",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                width: 104,
                child: Text(
                  "Temperature",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                  height: 60,
                  width: 60,
                  child: TextField(
                    controller: temp4Max,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                        hintText: 'Min'),
                  )),
               SizedBox(
                  height: 60,
                  width: 60,
                  child: TextField(
                    controller: temp4Max,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                        hintText: 'Max'),
                  )),
            ],
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                width: 104,
                child: Text(
                  "Humidity",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                  height: 60,
                  width: 60,
                  child: TextField(
                    controller: humidity4Min,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                        hintText: 'Min'),
                  )),
              SizedBox(
                  height: 60,
                  width: 60,
                  child: TextField(
                    controller: humidity4Max,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                        hintText: 'Max'),
                  )),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 104,
                child: Text(
                  "Noise",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                  height: 60,
                  width: 60,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                        hintText: 'Min'),
                  )),
              SizedBox(
                  height: 60,
                  width: 60,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                        hintText: 'Max'),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
