import 'package:crypto_wallet/ui/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, _) {
          final cryptos = viewModel.cryptoCurrencies;
          return ListView.builder(
            itemCount: cryptos.length,
            itemBuilder: (context, index) {
              final crypto = cryptos[index];
              return ListTile(
                title: Text(
                  crypto.name ?? '',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Preço: ${crypto.latestPrice?.amount?.amount}',
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
