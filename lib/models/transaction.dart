enum TransactionType {
  income,
  exspense,
}

class Transaction {
  final DateTime date;
  final TransactionType type;
  final double amount;
  final String note;

  Transaction({
    required this.date,
    required this.type,
    required this.amount,
    required this.note,
  });
}
