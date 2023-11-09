import 'package:cloud_firestore/cloud_firestore.dart';

class SensorFourDataSource {
  Stream<QuerySnapshot<Map<String,dynamic>>> sensorFourData() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor4')
        .collection('day')
        .doc('1')
        .collection('records')
        .orderBy('hour')
        .snapshots();
  }
}
