import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class ResumeCollection {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final String user = FirebaseAuth.instance.currentUser!.uid.toString();

  Future<void> addResumeProfile(
    String position,
    String salary,
    String description,
    dynamic docs,
  ) async {
    try {
      final DateTime now = DateTime.now();
      final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
      final String formatted = dateFormat.format(now);
      await _firebaseFirestore
          .collection('profiles')
          .doc(user)
          .collection('resumes')
          .add({
        'uid': user,
        'Position': position,
        'salary': salary,
        'description': description,
        'date': formatted,
        'surname': docs['surname'],
        'name': docs['name'],
        'patronymic': docs['patronymic'],
        'phone': docs['phone'],
        'email': docs['email'],        
      });
    } catch (e) {
      return;
    }
  }
  //Редактирование 
  Future<void> editResumes(
    String position,
    String salary,
    String description,
    dynamic docs,
  ) async{
    try {;
      final DateTime now = DateTime.now();
      final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
      final String formatted = dateFormat.format(now);
      await _firebaseFirestore
         .collection('profiles')
          .doc(user)
          .collection('resumes')
          .doc(docs.id)
          .update({
        'Position': position,
        'salary': salary,
        'description': description,    
        'date': formatted,
      });
    } catch (e) {
      return;
    }
  }
  //удаление
  Future<void> deleteResumes(
    dynamic docs,
  ) async {
    try {
      await _firebaseFirestore
      .collection('profiles')
      .doc(user)
      .collection('resumes')
      .doc(docs.id)
      .delete();
    } catch (e) {
      return;
    }
  }
}
