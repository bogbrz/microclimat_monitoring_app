import 'package:cloud_firestore/cloud_firestore.dart';

class SensorFiveDataSource {
  Stream<QuerySnapshot> sensorFiveData() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor5')
        .collection('day')
        .doc('1')
        .collection('records')
        .orderBy('hour')
        .snapshots();
  }
}
