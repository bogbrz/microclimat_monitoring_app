import 'package:flutter/material.dart';

class SensorTwoSettings extends StatelessWidget {
  const SensorTwoSettings({
    super.key,
    required this.temp2Max,
    required this.temp2Min,
    required this.humidity2Max,
    required this.humidity2Min,
    required this.noise2Max,
    required this.noise2Min,
  });

  final TextEditingController? temp2Min;
  final TextEditingController? temp2Max;
  final TextEditingController? humidity2Min;
  final TextEditingController? humidity2Max;
  final TextEditingController? noise2Min;
  final TextEditingController? noise2Max;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
            "Sensor 2",
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
                    controller: temp2Min,
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
                    controller: temp2Max,
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
                    controller: humidity2Min,
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
                    controller: humidity2Max,
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
                    controller: noise2Min,
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
                    controller: noise2Max,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
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
