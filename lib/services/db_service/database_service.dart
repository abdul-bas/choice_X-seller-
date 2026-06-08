

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
 Stream<QuerySnapshot<Map<String, dynamic>>> getCategories()  {
   return  _db.collection('category').snapshots();
   
  }

  getBrands()  {
  return _db.collection('brand').snapshots();
   
  }

  
}