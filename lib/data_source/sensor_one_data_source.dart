import 'package:cloud_firestore/cloud_firestore.dart';

class SensorOneDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> sensorOneData() {
    return FirebaseFirestore.instance
        .collection('sensor1')
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
    await FirebaseFirestore.instance.collection("sensor1").add(
      {
        "hour": hour,
        "temp": temp,
        "humidity": humidity,
        "noise": noise,
        "sensorId": sensorId,
      },
    );
  }

  Future<void> removeGeneratedData() async {
    return FirebaseFirestore.instance
        .collection('sensor1')
        .doc()
        .delete()
        .then((doc) => print("Document 1 deleted"));
  }
}
