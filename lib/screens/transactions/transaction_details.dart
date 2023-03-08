import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key});

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
      body: Container(
        child: Row(
          children: const [
            Center(
              child: Text(
                '20 USD',
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
