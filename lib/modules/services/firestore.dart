import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ponto_app/modules/services/firebase.dart';
import 'package:ponto_app/modules/utils/logger.dart';

abstract class IFirestoreService {
  Future<Map<String, dynamic>?> get({required String collectionPath, required String id});
  Future<List<Map<String, dynamic>>> fetch({required String collectionPath});
  Future<Map<String, dynamic>?> create({required String collectionPath, required Map<String, dynamic> data});
  Future<List<Map<String, dynamic>?>> where({required String collectionPath, required Object field, required Object? isEqualTo});
}

class FirestoreService implements IFirestoreService {
  final FirebaseService firebase;
  late final FirebaseFirestore firestore;

  FirestoreService(this.firebase);

  FirestoreService onInit() {
    firestore = FirebaseFirestore.instanceFor(app: firebase.app);
    return this;
  }

  @override
  Future<List<Map<String, dynamic>>> fetch({required String collectionPath}) async {
    try {
      final query = await firestore.collection(collectionPath).get();
      return query.docs.map((e) => e.data()).toList();
    } catch (error, exception) {
      logMsg("Error on fetch register", error, exception);
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>?> get({required String collectionPath, required String id}) async {
    try {
      final document = await firestore.collection(collectionPath).doc(id).get();
      return document.data();
    } catch (error, exception) {
      logMsg("Error on get register", error, exception);
      rethrow;
    }
  }
  
  @override
  Future<Map<String, dynamic>?> create({required String collectionPath, required Map<String, dynamic> data}) async {
    try {
      final collection = firestore.collection(collectionPath);
      final document = await collection.add(data);
      return (await document.get()).data();
    } catch (error, exception) {
      logMsg("Error on create register", error, exception);
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>?>> where({
    required String collectionPath, required Object field, required Object? isEqualTo}) async {
    try {
      final query = await firestore.collection(collectionPath).where(field, isEqualTo: isEqualTo).get();
      return query.docs.map((e) => e.data()).toList();
    } catch (error, exception) {
      logMsg("Error on get register where", error, exception);
      rethrow;
    }
  }
}