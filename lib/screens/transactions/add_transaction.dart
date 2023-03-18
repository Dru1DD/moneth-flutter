import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/widgets.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({
    super.key,
  });

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Add Transaction'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => GoRouter.of(context).push('/'),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Income',
                  icon: Icon(Icons.add),
                ),
                Tab(
                  text: 'Exspence',
                  icon: Icon(Icons.call_missed_outgoing_sharp),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              TransactionForm(
                activeTabIndex: 0,
              ),
              TransactionForm(
                activeTabIndex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
