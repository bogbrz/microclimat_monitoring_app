import 'package:cloud_firestore/cloud_firestore.dart';

class SensorThreeDataSource {
  Stream<QuerySnapshot<Map<String,dynamic>>> sensorThreeData() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor3')
        .collection('day')
        .doc('1')
        .collection('records')
        .orderBy('hour')
        .snapshots();
  }
}
