import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Center(child: Text('Nenhum usuário logado'));
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user.photoURL != null)
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.photoURL!),
              )
            else
              const CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50),
              ),
            const SizedBox(height: 16),
            Text(
              user.displayName ?? 'Sem nome',
              style: const TextStyle(fontSize: 20,color: AppColors.white),
            ),
            const SizedBox(height: 8),
            Text(user.email ?? 'Sem e-mail',style: TextStyle(color: AppColors.white),),
          ],
        ),
      ),
    );
  }
}
