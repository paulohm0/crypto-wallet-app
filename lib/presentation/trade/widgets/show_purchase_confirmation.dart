import 'package:crypto_wallet/presentation/info_crypto/view/info_crypto_view.dart';
import 'package:flutter/material.dart';

import 'purchase_confirmation_modal.dart';

void showPurchaseConfirmationModal({
  required BuildContext context,
  required TradeArguments tradeInformation,
  required double quantity,
  required double value,
  required VoidCallback onConfirm,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withAlpha(25),
    builder:
        (_) => PurchaseConfirmationModal(
          tradeInformation: tradeInformation,
          quantity: quantity,
          value: value,
          onConfirm: onConfirm,
        ),
  );
}
