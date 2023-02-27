import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String incomeType;
  final String cardType;
  final String transactionType;
  final String transactionTime;
  final int amount;
  final IconData transactionIcon;
  final IconData icon;

  const TransactionItem({
    super.key,
    required this.incomeType,
    required this.cardType,
    required this.transactionType,
    required this.transactionTime,
    required this.transactionIcon,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.deepPurpleAccent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 75,
              child: Center(
                child: Icon(transactionIcon),
              ),
            ),
            Expanded(
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(incomeType),
                  Text(cardType),
                  Text(transactionTime),
                ],
              ),
            ),
            SizedBox(
              width: 60,
              child: Row(
                children: [
                  Text(transactionType),
                  Text(amount.toString()),
                  Icon(icon),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
