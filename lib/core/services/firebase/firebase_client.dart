import 'package:firebase_auth/firebase_auth.dart';

class FirebaseClient {
  final FirebaseAuth firebaseAuth;

  FirebaseClient({FirebaseAuth? authInstance})
    : firebaseAuth = authInstance ?? FirebaseAuth.instance;
}
