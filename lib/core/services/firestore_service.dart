import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:fruits_ecommerce_app/features/auth/domain/entity/user_entity.dart';

import 'database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await firestore.collection(path).add(data);
  }

  @override
  Future<UserEntity> getUserData({
    required String path,
    required String uID,
  }) async {
    var data = await firestore.collection(path).doc(uID).get();
    return UserModel.fromJson(data.data() as Map<String, dynamic>);
  }
}
