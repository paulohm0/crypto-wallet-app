import 'dart:developer';

import 'package:crypto_wallet/core/services/firebase/firebase_client.dart';
import 'package:crypto_wallet/data/models/firestore_database/firestore_db_model.dart';

class DbRepository {
  final databaseRepository = FirebaseClient();

  Future<void> addUser(UserFirestoreDbModel userData) async {
    try {
      await databaseRepository.dbFirestore
          .collection('users')
          .add(userData.toMap());
    } catch (e, st) {
      log('Erro ao adicionar usuário', error: e, stackTrace: st);
    }
  }
}
