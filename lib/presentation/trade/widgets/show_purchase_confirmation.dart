import 'dart:ui';

import 'package:crypto_wallet/presentation/info_crypto/view/info_crypto_view.dart';
import 'package:crypto_wallet/presentation/trade/view_model/trade_view_model.dart';
import 'package:flutter/material.dart';

import 'purchase_confirmation_modal.dart';

void showPurchaseConfirmationModal({
  required BuildContext context,
  required TradeViewModel viewModel,
  required TradeArguments tradeInformation,
  required double quantity,
  required double value,
  required VoidCallback onConfirm,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withAlpha(75),
    builder:
        (_) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: PurchaseConfirmationModal(
            viewModel: viewModel,
            tradeInformation: tradeInformation,
            quantity: quantity,
            value: value,
            onConfirm: onConfirm,
          ),
        ),
  );
}
