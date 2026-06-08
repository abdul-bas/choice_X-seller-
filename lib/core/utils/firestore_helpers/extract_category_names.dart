import 'package:cloud_firestore/cloud_firestore.dart';

List<String> extractCategoryNames(
    QuerySnapshot<Map<String, dynamic>> snapshot) {

  return snapshot.docs
      .map((doc) => doc.data()['name'].toString())
      .toList();
}