import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

const transactionExample = [
  {
    'incomeType': 'Salary',
    'cardType': 'Debet card',
    'transactionType': '+',
    'transactionTime': '17:09',
    'amount': 20,
    'icon': Icons.arrow_forward_ios_rounded,
    'transactionIcon': Icons.shopping_cart,
  },
  {
    'incomeType': 'Salary',
    'cardType': 'Debet card',
    'transactionType': '+',
    'transactionTime': '17:09',
    'amount': 20,
    'icon': Icons.arrow_forward_ios_rounded,
    'transactionIcon': Icons.shopping_cart,
  },
  {
    'incomeType': 'Salary',
    'cardType': 'Debet card',
    'transactionType': '+',
    'transactionTime': '17:09',
    'amount': 20,
    'icon': Icons.arrow_forward_ios_rounded,
    'transactionIcon': Icons.shopping_cart,
  },
  {
    'incomeType': 'Salary',
    'cardType': 'Debet card',
    'transactionType': '+',
    'transactionTime': '17:09',
    'amount': 20,
    'icon': Icons.arrow_forward_ios_rounded,
    'transactionIcon': Icons.shopping_cart,
  },
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List transactionList = [];

  @override
  void initState() {
    transactionList.addAll(transactionExample);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _iconPressHandler() {
    final transactionData = {
      'incomeType': 'Salary',
      'cardType': 'Debet card',
      'transactionType': '+',
      'transactionTime': '17:09',
      'amount': 20,
      'icon': Icons.arrow_forward_ios_rounded,
      'transactionIcon': Icons.shopping_cart,
    };

    setState(() {
      transactionList.add(transactionData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Add transaction',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      onPressed: _iconPressHandler,
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(transactionList.length.toString()),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: transactionList.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TransactionItem(
                        incomeType: transactionList[index]['incomeType'],
                        cardType: transactionList[index]['cardType'],
                        transactionType: transactionList[index]
                            ['transactionType'],
                        transactionTime: transactionList[index]
                            ['transactionTime'],
                        transactionIcon: transactionList[index]
                            ['transactionIcon'],
                        amount: transactionList[index]['amount'],
                        icon: transactionList[index]['icon'],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
