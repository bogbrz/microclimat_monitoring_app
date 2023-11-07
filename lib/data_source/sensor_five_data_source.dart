import 'package:cloud_firestore/cloud_firestore.dart';

class SensorFiveDataSource {
  Stream<QuerySnapshot> sensorFiveTemp() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor5')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('temperature')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> sensorFiveHumidity() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor5')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('temperature')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> sensorFiveNoise() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor5')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('temperature')
        .orderBy('hour', descending: false)
        .snapshots();
  }
}
