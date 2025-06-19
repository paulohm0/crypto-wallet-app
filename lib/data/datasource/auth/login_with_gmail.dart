import 'package:crypto_wallet/core/services/firebase/firebase_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  final _auth = FirebaseClient();

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );
      return await _auth.firebaseAuth.signInWithCredential(credential);
    } catch (error, stacktrace) {
      debugPrint('Google sign-in failed: $error');
      debugPrintStack(stackTrace: stacktrace);
      throw Exception('Erro ao fazer login com o Google');
    }
  }
}
