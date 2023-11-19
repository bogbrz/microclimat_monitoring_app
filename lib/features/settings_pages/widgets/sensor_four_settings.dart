

import 'package:flutter/material.dart';

class SensorFourSettings extends StatelessWidget {
  const SensorFourSettings({
    super.key,
    required this.temp4Controller,
  });

  final TextEditingController? temp4Controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Sensor 4",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
         SizedBox(
      height: 10,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              "Temp.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 60,
                width: 60,
                child: TextField(
                  controller: temp4Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(),
                      hintText: 'Min'),
                )),
            SizedBox(
              height: 10,
            ),
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
        ),
        Column(
          children: [
            Text(
              "Humidity",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
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
              height: 10,
            ),
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
        ),
        Column(
          children: [
            Text(
              "Noise",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
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
              height: 10,
            ),
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
        ),
      ],
    ),
      ],
    );
  }
}


