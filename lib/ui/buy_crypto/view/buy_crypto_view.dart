import 'package:crypto_wallet/data/models/crypto_model.dart';
import 'package:crypto_wallet/shared/widgets/app_bar_custom.dart';
import 'package:crypto_wallet/ui/buy_crypto/view_model/buy_crypto_view_model.dart';
import 'package:crypto_wallet/ui/buy_crypto/widgets/crypto_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuyCryptoView extends StatefulWidget {
  const BuyCryptoView({super.key});

  @override
  State<BuyCryptoView> createState() => _BuyCryptoViewState();
}

class _BuyCryptoViewState extends State<BuyCryptoView> {
  late BuyCryptoViewModel viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as CryptoModel;
    viewModel = context.read<BuyCryptoViewModel>();
    viewModel.fetchCryptoPricesToChart(args.id, 'BRL');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: Consumer<BuyCryptoViewModel>(
        builder: (context, viewModel, _) {
          return CryptoChart(spots: viewModel.spots);
        },
      ),
    );
  }
}
