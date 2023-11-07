import 'package:cloud_firestore/cloud_firestore.dart';

class SensorTwoDataSource {
  Stream<QuerySnapshot> sensorTwoHumidity() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor2')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('humidity')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> sensorTwoTemp() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor2')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('temperature')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> sensorTwoNoise() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor2')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('noise')
        .orderBy('hour', descending: false)
        .snapshots();
  }
}
