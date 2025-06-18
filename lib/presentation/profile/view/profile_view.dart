import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:crypto_wallet/presentation/profile/widgets/option_box.dart';
import 'package:crypto_wallet/shared/navigation/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.greyBackground,
                    border: Border.all(color: AppColors.primary, width: 0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
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
                        SizedBox(height: 8.0),
                        Text(
                          user.displayName ?? 'Sem nome',
                          style: const TextStyle(
                            fontSize: AppFontSizes.md,
                            color: AppColors.white,
                            fontWeight: AppFontWeights.bold,
                          ),
                        ),
                        Text(
                          user.email ?? 'Sem e-mail',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: AppFontSizes.ss,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              OptionBox(icon: Icons.description, label: 'Detalhes'),
              OptionBox(icon: Icons.notifications_none, label: 'Notificações'),
              OptionBox(icon: Icons.security_outlined, label: 'Segurança'),
              OptionBox(icon: Icons.help_outline, label: 'Suporte'),
              TextButton(
                style: ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  await GoogleSignIn().signOut();
                  if (context.mounted) {
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
                  }
                },
                child: Text(
                  'Sair',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: AppFontWeights.bold,
                    fontSize: AppFontSizes.xs,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
