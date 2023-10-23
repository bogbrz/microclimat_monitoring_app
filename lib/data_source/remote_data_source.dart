import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:microclimat_monitoring_app/datamodel.dart';

class RemoteData {
  Stream<List<DataModel>> getDataModelStream() {
    return FirebaseFirestore.instance
        .collection('sensor1')
        .orderBy('day', descending: false)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return DataModel(temperature: doc['temp'], date: doc['day']);
      }).toList();
    });
  }

  Future<void> add({required int temp, required int day}) async {
    await FirebaseFirestore.instance.collection('sensor1').add({
      'day': day,
      'temp': temp,
    });
  }
}
