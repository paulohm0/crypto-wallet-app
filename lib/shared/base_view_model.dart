import 'package:crypto_wallet/core/utils/view_state_enum.dart';
import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void setState(ViewState state, [String? error]) {
    _state = state;
    _errorMessage = error;
    notifyListeners();
  }
}
