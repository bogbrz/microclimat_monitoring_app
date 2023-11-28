import 'package:flutter/material.dart';

class SensorThreeSettings extends StatelessWidget {
  const SensorThreeSettings({
    super.key,
    required this.temp3Max,
    required this.temp3Min,
    required this.noise3Max,
    required this.noise3Min,
    required this.humidity3Max,
    required this.humidity3Min,
  });

  final TextEditingController? temp3Min;
  final TextEditingController? temp3Max;
  final TextEditingController? humidity3Min;
  final TextEditingController? humidity3Max;
  final TextEditingController? noise3Min;
  final TextEditingController? noise3Max;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
            "Sensor 3",
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
                    controller: temp3Min,
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
                    controller: temp3Max,
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
                    controller: humidity3Min,
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
                    controller: humidity3Max,
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
                    controller: noise3Min,
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
                    controller: humidity3Max,
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
