import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';
import '../../store/store.dart';

class TransactionDetails extends StatelessWidget {
  final int transactionId;

  const TransactionDetails({
    super.key,
    required this.transactionId,
  });

  @override
  Widget build(BuildContext context) {
    final MobXStore store = Provider.of<MobXStore>(context);
    final transactionList = store.transactionList;

    return Scaffold(
      appBar: AppBar(
        title: Text(transactionList[transactionId]['catagory']),
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
            Field(
              firstLabel: 'Account',
              secondLabel:
                  transactionList[transactionId]['cardType'].toString(),
            ),
            Field(
              firstLabel: 'Catagory',
              secondLabel:
                  transactionList[transactionId]['catagory'].toString(),
            ),
            Field(
              firstLabel: 'Transaction time',
              secondLabel: transactionList[transactionId]['transactionTime'],
            ),
            Field(
              firstLabel: 'Currency',
              secondLabel: transactionList[transactionId]['currency'],
            ),
          ],
        ),
      ),
    );
  }
}
