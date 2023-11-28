import 'package:cloud_firestore/cloud_firestore.dart';

class SensorFiveDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> sensorFiveData() {
    return FirebaseFirestore.instance
        .collection('sensor5')
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
    await FirebaseFirestore.instance.collection('sensor5').add(
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
    await FirebaseFirestore.instance
        .collection('sensor5')
        .doc()
        .delete()
        .then((doc) => print("Document 1 deleted"));
  }
}
