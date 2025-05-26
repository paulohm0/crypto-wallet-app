import 'package:crypto_wallet/core/utils/view_state_enum.dart';
import 'package:crypto_wallet/ui/home/view_model/home_view_model.dart';
import 'package:crypto_wallet/ui/home/widgets/crypto_item_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, _) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar por moeda',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[300],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 6.0,
                      ),
                      constraints: const BoxConstraints(maxHeight: 35.0),
                    ),
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                    onChanged: (value) {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Criptomoedas',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        PopupMenuButton<String>(
                          onSelected: (String value) {},
                          itemBuilder: (BuildContext context) {
                            return <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                value: '1',
                                child: Text('Opção1'),
                              ),
                              const PopupMenuItem<String>(
                                value: '2',
                                child: Text('Opção2'),
                              ),
                              const PopupMenuItem<String>(
                                value: '3',
                                child: Text('Opção3'),
                              ),
                            ];
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 6.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: const Color(0xFFFEB83D),
                                width: 1.0,
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Filtrar',
                                  style: TextStyle(color: Color(0xFFFEB83D)),
                                ),
                                SizedBox(width: 4.0),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xFFFEB83D),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child:
                        viewModel.state == ViewState.loading
                            ? const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFFFEB83D),
                                strokeWidth: 2.0,
                              ),
                            )
                            : ListView.separated(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: false,
                              separatorBuilder: (context, index) {
                                return const Divider(color: Colors.white10);
                              },
                              itemCount: viewModel.cryptoCurrencies.length,
                              itemBuilder: (context, index) {
                                final crypto =
                                    viewModel.cryptoCurrencies[index];
                                return CryptoItemHome(
                                  name: crypto.name,
                                  price: crypto.latestPrice.amount.amount,
                                  symbol: crypto.symbol,
                                  iconAssetPath: crypto.imageUrl,
                                  amount: crypto.latestPrice.amount.amount,
                                  percentChangeLastHour:
                                      crypto.latestPrice.percentChange.hour,
                                );
                              },
                            ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
