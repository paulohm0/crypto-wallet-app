import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/core/theme/app_font_weights.dart';
import 'package:flutter/material.dart';

class EmailPasswordInput extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FormFieldValidator<String>? emailValidator;
  final FormFieldValidator<String>? passwordValidator;

  const EmailPasswordInput({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.emailValidator,
    this.passwordValidator,
  });

  @override
  State<EmailPasswordInput> createState() => _EmailPasswordInputState();
}

class _EmailPasswordInputState extends State<EmailPasswordInput> {
  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(
            color: AppColors.white,
            fontWeight: AppFontWeights.bold,
            fontSize: AppFontSizes.xs,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 40.0,
          child: TextFormField(
            controller: widget.emailController,
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Example@email.com',
              hintStyle: TextStyle(fontSize: AppFontSizes.xs),
              fillColor: AppColors.white.withAlpha(25),
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(
              color: Colors.white,
              fontSize: AppFontSizes.xs,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        const Text(
          'Senha',
          style: TextStyle(
            color: AppColors.white,
            fontWeight: AppFontWeights.bold,
            fontSize: AppFontSizes.xs,
          ),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 40.0,
          child: TextFormField(
            controller: widget.passwordController,
            obscureText: !_visiblePassword,
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Até 8 digitos',
              hintStyle: TextStyle(fontSize: AppFontSizes.xs),
              fillColor: AppColors.white.withAlpha(25),
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      _visiblePassword = !_visiblePassword;
                    });
                  },
                  child: SizedBox(
                    width: 8,
                    height: 8,
                    child: Center(
                      child: Icon(
                        _visiblePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white70,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            style: const TextStyle(
              color: Colors.white,
              fontSize: AppFontSizes.xs,
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Esqueceu sua senha ?',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: AppFontSizes.sss,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
