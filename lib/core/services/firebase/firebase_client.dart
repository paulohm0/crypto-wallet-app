import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseClient {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore dbFirestore = FirebaseFirestore.instance;
}
