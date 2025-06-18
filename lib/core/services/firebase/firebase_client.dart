import 'package:firebase_auth/firebase_auth.dart';

class FirebaseClient {
  final FirebaseAuth firebaseAuth;

  // útil para testes com mocks !
  FirebaseClient({FirebaseAuth? authInstance})
    : firebaseAuth = authInstance ?? FirebaseAuth.instance;
}
