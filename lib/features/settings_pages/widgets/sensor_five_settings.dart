import 'package:flutter/material.dart';

class SensorFiveSettings extends StatelessWidget {
  const SensorFiveSettings({
    super.key,
   required this.temp5Max,
    required this.temp5Min,
    required this.humidity5Max,
    required this.humidity5Min,
    required this.noise5Min,
    required this.noise5Max,
  });

  final TextEditingController? temp5Min;
  final TextEditingController? temp5Max;
  final TextEditingController? humidity5Min;
  final TextEditingController? humidity5Max;
  final TextEditingController? noise5Min;
  final TextEditingController? noise5Max;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
            "Sensor 5",
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
                    controller: temp5Min,
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
                    controller: temp5Max,
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
                    controller: humidity5Min,
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
                    controller: humidity5Max,
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
                    controller: noise5Min,
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
                    controller: noise5Max,
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
