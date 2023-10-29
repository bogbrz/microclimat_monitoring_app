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

  Stream<QuerySnapshot> getTempData2() {
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

  Stream<QuerySnapshot> getTempData3() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor3')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('temperature')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> getTempData4() {
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

  Stream<QuerySnapshot> getTempData5() {
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

  Future<void> addTemp2({required int temp, required int hour}) async {
    await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor2')
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

  Future<void> addTemp3({required int temp, required int hour}) async {
    await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor3')
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

  Future<void> addTemp4({required int temp, required int hour}) async {
    await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor4')
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

  Future<void> addTemp5({required int temp, required int hour}) async {
    await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor5')
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
