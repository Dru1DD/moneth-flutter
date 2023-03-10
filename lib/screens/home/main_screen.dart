import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

import '../../store/store.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MobXStore _store = MobXStore();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
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
                    onPressed: () {
                      // GoRouter.of(context).push('/add-transaction');
                      _store.addNewTransaction(
                        'Salary',
                        'Debet Card',
                        '+',
                        '17:20',
                        Icons.shopping_cart,
                        20,
                      );
                    },
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ObservableListView(
                transactionList: _store.transactionList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
