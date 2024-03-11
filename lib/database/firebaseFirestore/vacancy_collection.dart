import 'package:cloud_firestore/cloud_firestore.dart';

class VacancyCollection{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> addVacancy(
    String id,
    String post,
    String salary,
    String description,
    String datePublicaion,
    String workSchedule, 
    String idEmployer,
    String nameOrganization,
  ) async{
    try {
      await _firebaseFirestore.collection("vacancy").add({
        'vid':id,
        'post': post,
        'salary': salary,
        'description': description,
        'datePublication': datePublicaion,
        'workSchedule': workSchedule,
        'idEmployer': idEmployer,
        'nameOrgamization': nameOrganization,
      });
    } catch(e) {
      return;
    }
  }

    Future<void> editVacancy(
    dynamic docs,
    String post,
    String salary,
    String description,
    String workSchedule, 
  ) async{
    try {
      await _firebaseFirestore.collection("vacancy").doc(docs.id).set({
        'post': post,
        'salary': salary,
        'description': description,
        'workSchedule': workSchedule,
      });
    } catch(e) {
      return;
    }
  }

    Future<void> deleteVacancy(
        dynamic docs,
  ) async{
    try {
      await _firebaseFirestore.collection("vacancy").doc(docs.id).delete();
    } catch(e) {
      return;
    }
  }
}