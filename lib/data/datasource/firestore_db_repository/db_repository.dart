import 'dart:developer';

import 'package:crypto_wallet/core/services/firebase/firebase_client.dart';
import 'package:crypto_wallet/data/models/firestore_database/firestore_db_model.dart';

class DbRepository {
  final databaseRepository = FirebaseClient();

  Future<void> addUser(UserFirestoreDbModel userData) async {
    try {
      final querySnapshot =
          await databaseRepository.dbFirestore
              .collection('users')
              .where('email', isEqualTo: userData.email)
              .limit(1)
              .get();
      if (querySnapshot.docs.isEmpty) {
        await databaseRepository.dbFirestore
            .collection('users')
            .add(userData.toMap());
      } else {
        log('Usuário já existe.');
      }
    } catch (e, st) {
      log('Erro ao verificar/criar usuário', error: e, stackTrace: st);
    }
  }
}
