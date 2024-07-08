import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addNotesDetails(Map<String, dynamic> notesInfoMap, String id) async {
  try {
    await FirebaseFirestore.instance.collection("Notes").doc(id).set(notesInfoMap);
    log('Notes added successfully');
  } catch (e) {
    log('Error adding notes: $e');
  }
}

Future<Stream<QuerySnapshot>> fetchAllNotesDetails() async {
  try {
    return FirebaseFirestore.instance.collection("Notes").snapshots();
  } catch (e) {
    log('Error fetching notes: $e');
    throw Exception('Failed to fetch notes');
  }
}

Future<void> deleteNotesDetails(String id) async {
  try {
    await FirebaseFirestore.instance.collection("Notes").doc(id).delete();
    log('Notes deleted successfully');
  } catch (e) {
    log('Error deleting notes: $e');
  }
}

Future<void> updateNotesDetails(String id, Map<String, dynamic> updatedNotesInfoMap) async {
  try {
    await FirebaseFirestore.instance.collection("Notes").doc(id).update(updatedNotesInfoMap);
    log('Notes updated successfully');
  } catch (e) {
    log('Error updating notes: $e');
  }
}
