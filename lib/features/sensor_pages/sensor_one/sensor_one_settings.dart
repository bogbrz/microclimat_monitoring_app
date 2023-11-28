import 'package:flutter/material.dart';

class SensorOneSettings extends StatefulWidget {
  SensorOneSettings({
    super.key,
  });
  final temp1MaxC = TextEditingController();
  final temp1MinC = TextEditingController();
  final humidity1MinC = TextEditingController();
  final humidity1MaxC = TextEditingController();
  final noise1MinC = TextEditingController();
  final noise1MaxC = TextEditingController();

  @override
  State<SensorOneSettings> createState() => _SensorOneSettingsState();
}

class _SensorOneSettingsState extends State<SensorOneSettings> {
  @override
  Widget build(BuildContext context) {
    
        return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                const Text(
                  "Sensor 1",
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
                          controller: widget.temp1MinC,
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
                          controller: widget.temp1MaxC,
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
                          controller: widget.humidity1MinC,
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
                          controller: widget.humidity1MaxC,
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
                          controller: widget.noise1MinC,
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
                          controller: widget.noise1MaxC,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              border: OutlineInputBorder(),
                              hintText: 'Max'),
                        )),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                     
                    },
                    child: Text("Set"))
              ],
            ));
     
  }
}
