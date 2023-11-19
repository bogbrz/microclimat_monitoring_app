import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@injectable
class SensorFourDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> sensorFourData() {
    return FirebaseFirestore.instance
        .collection('sensor4')
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
    await FirebaseFirestore.instance.collection('sensor4').add(
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
        .collection('sensor4')
        .doc()
        .delete()
        .then((doc) => print("Document 1 deleted"));
  }
}
