import 'package:crypto_wallet/core/theme/app_colors.dart';
import 'package:crypto_wallet/core/theme/app_font_sizes.dart';
import 'package:crypto_wallet/presentation/_common/app_bar_custom.dart';
import 'package:crypto_wallet/presentation/home/view/home_view.dart';
import 'package:crypto_wallet/presentation/portfolio/view/portfolio_view.dart';
import 'package:crypto_wallet/presentation/profile/view/profile_view.dart';
import 'package:flutter/material.dart';

class MainNavView extends StatefulWidget {
  const MainNavView({super.key});

  @override
  State<MainNavView> createState() => _MainNavViewState();
}

class _MainNavViewState extends State<MainNavView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _routes = [
    const HomeView(),
    const PortfolioView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: IndexedStack(index: _selectedIndex, children: _routes),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: AppColors.grey2.withAlpha(75),
          highlightColor: Colors.transparent,
        ),
        child: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            iconSize: 20,
            selectedFontSize: AppFontSizes.sss,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.wallet),
                label: 'Portfólio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Perfil',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.black,
            unselectedItemColor: Colors.white,
            selectedItemColor: AppColors.primary,
            showUnselectedLabels: false,
            showSelectedLabels: true,
          ),
        ),
      ),
    );
  }
}
