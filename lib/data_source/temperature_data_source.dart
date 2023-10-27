import 'package:cloud_firestore/cloud_firestore.dart';

class TempDataSource {
  Stream<QuerySnapshot> getTempData() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor1')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('temperature')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Future<void> addTemp({required int temp, required int hour}) async {
    await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor1')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('temperature')
        .add({
      'hour': hour,
      'temp': temp,
    });
  }
}
