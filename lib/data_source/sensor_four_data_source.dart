import 'package:cloud_firestore/cloud_firestore.dart';

class SensorFourDataSource {
  Stream<QuerySnapshot> sensorFourTemp() {
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

  Stream<QuerySnapshot> sensorFourHumidity() {
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

  Stream<QuerySnapshot> sensorFourNoise() {
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
