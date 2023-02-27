import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: ListView(
          padding: const EdgeInsets.only(top: 20.0),
          children: const [
            SizedBox(height: 18),
            Text('Main Screen'),
            TransactionItem(
              incomeType: 'Salary',
              cardType: 'Debet card',
              transactionType: '+',
              transactionTime: '17:09',
              amount: 20,
              icon: Icons.arrow_forward_ios_rounded,
              transactionIcon: Icons.shopping_cart,
            ),
          ],
        ),
      ),
    );
  }
}
