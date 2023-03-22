import 'package:flutter/material.dart';

import '../widgets.dart';

class TransactionItem extends StatelessWidget {
  final String cardType;
  final String catagory;
  final String transactionType;
  final String transactionTime;
  final int amount;
  final IconData transactionIcon;
  final bool isShowArrow;

  const TransactionItem({
    super.key,
    required this.cardType,
    required this.catagory,
    required this.transactionType,
    required this.transactionTime,
    required this.transactionIcon,
    required this.amount,
    required this.isShowArrow,
  });

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      start: 0.9,
      end: 0.6,
      color: Colors.purple,
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
            SizedBox(
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cardType),
                  Text(catagory),
                  Text(transactionTime),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 60,
              child: Row(
                children: [
                  Text(transactionType),
                  Expanded(
                    child: Text(
                      amount.toString(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  buildArrow(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildArrow(BuildContext context) {
    return isShowArrow ? const Icon(Icons.arrow_forward_ios) : const Spacer();
  }
}
