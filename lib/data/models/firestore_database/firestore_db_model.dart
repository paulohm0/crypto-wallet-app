import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirestoreDbModel {
  final String name;
  final String email;

  UserFirestoreDbModel({required this.name, required this.email});

  factory UserFirestoreDbModel.fromMap(String id, Map<String, dynamic> map) {
    return UserFirestoreDbModel(name: map['name'], email: map['email']);
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email};
  }
}

class CryptoAssetDbModel {
  final String ticker;
  final String name;
  final String iconUrl;
  final double quantity;
  final double amountInvested;
  final List<TransactionModel> transactions;

  CryptoAssetDbModel({
    required this.ticker,
    required this.name,
    required this.iconUrl,
    required this.quantity,
    required this.amountInvested,
    required this.transactions,
  });

  factory CryptoAssetDbModel.fromMap(
    Map<String, dynamic> map,
    List<TransactionModel> transactionsList,
  ) {
    return CryptoAssetDbModel(
      ticker: map['ticker'],
      name: map['name'],
      iconUrl: map['iconUrl'],
      quantity: map['quantity'].toDouble(),
      amountInvested: map['amountInvested'].toDouble(),
      transactions: transactionsList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ticker': ticker,
      'name': name,
      'iconUrl': iconUrl,
      'quantity': quantity,
      'amountInvested': amountInvested,
      // transactions NÃO deve ser salva aqui — ela é uma subcoleção separada, o fetch é feito separado
    };
  }
}

class TransactionModel {
  final DateTime timestamp;
  final String side;
  final String cryptoName;
  final String iconUrl;
  final double amount;
  final double quantity;

  TransactionModel({
    required this.timestamp,
    required this.side,
    required this.cryptoName,
    required this.iconUrl,
    required this.amount,
    required this.quantity,
  });

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      side: map['side'],
      cryptoName: map['cryptoName'],
      iconUrl: map['iconUrl'],
      amount: map['amount'].toDouble(),
      quantity: map['quantity'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'timestamp': timestamp,
      'side': side,
      'cryptoName': cryptoName,
      'iconUrl': iconUrl,
      'amount': amount,
      'quantity': quantity,
    };
  }
}
