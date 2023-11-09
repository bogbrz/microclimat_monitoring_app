import 'package:cloud_firestore/cloud_firestore.dart';

class SensorTwoDataSource {
  Stream<QuerySnapshot<Map<String,dynamic>>> sensorTwoData() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor2')
        .collection('day')
        .doc('1')
        .collection('records')
        .orderBy('hour')
        .snapshots();
  }
}
