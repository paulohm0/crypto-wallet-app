import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AppBarCustom({super.key}) : preferredSize = const Size.fromHeight(40);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Crypto',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: 'Wallet',
                style: TextStyle(
                  color: Color(0xFFFEB83D),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
