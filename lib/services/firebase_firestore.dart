

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreService
{
  final db = FirebaseFirestore.instance;


  Future<void> createProblem({required String description})
  async {
    try {
      final problem = db.collection("body").doc();
      final data = {
        'id': problem.id,
        'description': description,
      };
      await problem.set(data);
    }
    catch(e)
    {
      print("Проблема - - - - - - - - - -- - - -- - - -" + e.toString());
    }
  }
}