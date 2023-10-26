import 'package:cloud_firestore/cloud_firestore.dart';

class RemoteData {
  Stream<QuerySnapshot> getDataModelStream() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor1')
        .collection('temperature')
        .orderBy('day', descending: false)
        .snapshots();
  }

  Future<void> add({required int temp, required int day}) async {
    await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor1')
        .collection('temperature')
        .add({
      'day': day,
      'temp': temp,
    });
  }
}
