import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
@injectable
class SensorTwoDataSource {
  Stream<QuerySnapshot<Map<String,dynamic>>> sensorTwoData() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor2')
        .collection('day')
        .doc('1')
        .collection('records')
        .orderBy('hour')
        .snapshots();
  }

  Future<void> addData({
    required int hour,
    required int temp,
    required int humidity,
    required int noise,
    required int sensorId,
  }) async {
    await FirebaseFirestore.instance
        .collection('senors')
        .doc("sensor2")
        .collection("day")
        .doc('1')
        .collection("records")
        .add(
      {
        "hour": hour,
        "temp": temp,
        "humidity": humidity,
        "noise": noise,
        "sensorId": sensorId,
      },
    );
  }
}
