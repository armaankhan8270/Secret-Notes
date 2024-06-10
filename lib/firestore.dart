import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');
}
