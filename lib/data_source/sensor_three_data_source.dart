import 'package:cloud_firestore/cloud_firestore.dart';

class SensorThreeDataSource {
  Stream<QuerySnapshot> sensorThreeTemp() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor3')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('temperature')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> sensorThreeHumidity() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor3')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('temperature')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> sensorThreeNoise() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor4')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('temperature')
        .orderBy('hour', descending: false)
        .snapshots();
  }
}
