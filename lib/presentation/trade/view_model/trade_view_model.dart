import 'package:crypto_wallet/presentation/info_crypto/view/info_crypto_view.dart';
import 'package:crypto_wallet/shared/base_view_model/base_view_model.dart';
import 'package:currency_textfield/currency_textfield.dart';

class TradeViewModel extends BaseViewModel {
  final TradeArguments tradeArguments;
  TradeViewModel(this.tradeArguments);

  bool get isBuy => tradeArguments.label.isBuy;

  String get inputLabel =>
      isBuy ? 'Quanto deseja investir?' : 'Quanto deseja vender?';

  String get amountLabel => isBuy ? 'Você vai pagar' : 'Você vai vender';

  String get purchaseOrSaleLabel =>
      isBuy ? 'Valor da compra' : 'Valor da venda';

  String get totalLabel => isBuy ? 'Total a pagar' : 'Total a receber';

  String get confirmButtonLabel =>
      isBuy ? 'Confirmar Compra' : 'Confirmar venda';

  String get operationInfoText =>
      isBuy
          ? 'Disponível para investir: R\$ 0,00'
          : 'Atualmente você possue: R\$ 100,00 em ${tradeArguments.cryptoArgs.crypto.symbol}';

  double getCryptoAmount(CurrencyTextFieldController controller) {
    final price = double.parse(
      tradeArguments.cryptoArgs.crypto.latestPrice.amount.amount,
    );
    return controller.doubleValue / price;
  }

  String? getErrorFieldValue(CurrencyTextFieldController controller) {
    return controller.doubleValue < 10.0 && controller.doubleValue > 0.0
        ? 'Valor mínimo é R\$ 10,00'
        : null;
  }

  bool isValidFieldValue(CurrencyTextFieldController controller) {
    return controller.doubleValue >= 10.0;
  }

  bool isValidFieldCrypto(CurrencyTextFieldController controller) {
    return controller.doubleValue > 0.0;
  }
}
