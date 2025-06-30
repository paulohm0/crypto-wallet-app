import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:crypto_wallet/data/datasource/auth/login_with_gmail.dart';
import 'package:crypto_wallet/data/datasource/firestore_db_repository/db_repository.dart';
import 'package:crypto_wallet/data/models/firestore_database/firestore_db_model.dart';
import 'package:crypto_wallet/presentation/login/widgets/email_password_input.dart';
import 'package:crypto_wallet/presentation/login/widgets/login_header.dart';
import 'package:crypto_wallet/shared/navigation/app_routes.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _auth = GoogleAuth();
  final _db = DbRepository();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 400,
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginHeader(),
                    SizedBox(height: 24.0),
                    EmailPasswordInput(
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.login);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: AppFontSizes.sm,
                                fontWeight: AppFontWeights.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Divider(thickness: 1, color: AppColors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'Ou entre com',
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: AppFontSizes.ss,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(thickness: 1, color: AppColors.grey),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () async {
                            final user = await _auth.signInWithGoogle();
                            final UserFirestoreDbModel userData =
                                UserFirestoreDbModel(
                                  name: user?.user?.displayName ?? '',
                                  email: user?.user?.email ?? '',
                                );
                            if (user != null) {
                              _db.addUser(userData);
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.main,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Falha ao fazer login com o Google',
                                  ),
                                ),
                              );
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            side: BorderSide(color: AppColors.white),
                            padding: const EdgeInsets.all(8),
                            backgroundColor: AppColors.white,
                          ),
                          child: Image.asset(
                            'assets/images/google_icon.png',
                            height: 24,
                            width: 24,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.main,
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            side: BorderSide(
                              color: AppColors.primary,
                              width: 0.7,
                            ),
                            padding: const EdgeInsets.all(8),
                            backgroundColor: Colors.black,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.person, color: AppColors.primary),
                              Icon(Icons.arrow_right, color: AppColors.primary),
                              Text(
                                'Visitante',
                                style: TextStyle(color: AppColors.primary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
