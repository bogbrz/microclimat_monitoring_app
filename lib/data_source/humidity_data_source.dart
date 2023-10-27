import 'package:cloud_firestore/cloud_firestore.dart';

class HumidityDataSource {
  Stream<QuerySnapshot> getHumidityData() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor1')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('humidity')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Future<void> addHumidity({required int humidity, required int hour}) async {
    await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor1')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('humidity')
        .add({
      'hour': hour,
      'humidity': humidity,
    });
  }
}
