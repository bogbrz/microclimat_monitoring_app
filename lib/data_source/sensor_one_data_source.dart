import 'package:cloud_firestore/cloud_firestore.dart';

class SensorOneDataSource {
  Stream<QuerySnapshot> sensorOneData() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor1')
        .collection('day')
        .doc('1')
        .collection('records')
        .orderBy('hour')
        .snapshots();
  }
}
