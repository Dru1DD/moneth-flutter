import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/widgets.dart';

import '../../example/transaction_list.dart';

class TransactionDetails extends StatelessWidget {
  final int transactionId;
  final transactionList = transactionExample;

  const TransactionDetails({super.key, required this.transactionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            GoRouter.of(context).go('/');
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                transactionList[transactionId]['amount'].toString(),
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
            const Field(
              firstLabel: 'Account',
              secondLabel: 'Debet card',
            ),
            const Field(
              firstLabel: 'Catagory',
              secondLabel: 'Shops',
            ),
            const Field(
              firstLabel: 'Transaction time',
              secondLabel: '17:09',
            ),
            const Field(
              firstLabel: 'Currency',
              secondLabel: 'USD',
            ),
          ],
        ),
      ),
    );
  }
}
