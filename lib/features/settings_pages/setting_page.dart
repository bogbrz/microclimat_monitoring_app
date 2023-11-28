import 'package:flutter/material.dart';
import 'package:microclimat_monitoring_app/features/settings_pages/widgets/sensor_five_settings.dart';
import 'package:microclimat_monitoring_app/features/settings_pages/widgets/sensor_four_settings.dart';

import 'package:microclimat_monitoring_app/features/settings_pages/widgets/sensor_three_settings.dart';
import 'package:microclimat_monitoring_app/features/settings_pages/widgets/sensor_two_settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
  

    TextEditingController? temp2Max;
    TextEditingController? temp2Min;
    TextEditingController? noise2Max;
    TextEditingController? noise2Min;
    TextEditingController? humidity2Max;
    TextEditingController? humiditiy2Min;

    TextEditingController? temp3Max;
    TextEditingController? temp3Min;
    TextEditingController? noise3Max;
    TextEditingController? noise3Min;
    TextEditingController? humidity3Max;
    TextEditingController? humiditiy3Min;

    TextEditingController? temp4Max;
    TextEditingController? temp4Min;
    TextEditingController? noise4Max;
    TextEditingController? noise4Min;
    TextEditingController? humidity4Max;
    TextEditingController? humiditiy4Min;

    TextEditingController? temp5Max;
    TextEditingController? temp5Min;
    TextEditingController? noise5Max;
    TextEditingController? noise5Min;
    TextEditingController? humidity5Max;
    TextEditingController? humiditiy5Min;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(children: [
        const SizedBox(
          height: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SensorTwoSettings(
                      temp2Max: temp2Max,
                      temp2Min: temp2Min,
                      noise2Max: noise2Max,
                      noise2Min: noise2Min,
                      humidity2Max: humidity2Max,
                      humidity2Min: humiditiy2Min,
                    ),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 10,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Sensor 2",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SensorThreeSettings(
                      temp3Max: temp3Max,
                      temp3Min: temp3Min,
                      noise3Max: noise3Max,
                      noise3Min: noise3Min,
                      humidity3Max: humidity3Max,
                      humidity3Min: humiditiy3Min,
                    ),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 10,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Sensor 3",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SensorFourSettings(
                      temp4Max: temp4Max,
                      temp4Min: temp4Min,
                      noise4Max: noise4Max,
                      noise4Min: noise4Min,
                      humidity4Max: humidity4Max,
                      humidity4Min: humiditiy4Min,
                    ),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 10,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Sensor 4",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SensorFiveSettings(
                      temp5Max: temp5Max,
                      temp5Min: temp5Min,
                      noise5Max: noise5Max,
                      noise5Min: noise5Min,
                      humidity5Max: humidity5Max,
                      humidity5Min: humiditiy5Min,
                    ),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 10,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Sensor 5",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            )
          ],
        ),
      ]),
    );
  }
}
