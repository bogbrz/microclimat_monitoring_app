import 'package:flutter/material.dart';
import 'package:microclimat_monitoring_app/features/settings_pages/widgets/sensor_five_settings.dart';
import 'package:microclimat_monitoring_app/features/settings_pages/widgets/sensor_four_settings.dart';
import 'package:microclimat_monitoring_app/features/settings_pages/widgets/sensor_one_settings.dart';
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
    TextEditingController? temp1Controller;
    TextEditingController? temp2Controller;
    TextEditingController? temp3Controller;
    TextEditingController? temp4Controller;
    TextEditingController? temp5Controller;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Set minimum and maxium value",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SensorOneSettings(
                        temp1Controller: temp1Controller,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Sensor 1",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SensorTwoSettings(temp2Controller: temp2Controller),
          SizedBox(
            height: 10,
          ),
          SensorThreeSettings(temp3Controller: temp3Controller),
          SizedBox(
            height: 10,
          ),
          SensorFourSettings(temp4Controller: temp4Controller),
          SizedBox(
            height: 10,
          ),
          SensorFivedSettings(temp5Controller: temp5Controller),
        ],
      ),
    );
  }
}
