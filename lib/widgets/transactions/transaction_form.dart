// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../store/store.dart';
import './../widgets.dart';

class TransactionForm extends StatefulWidget {
  final int activeTabIndex;

  const TransactionForm({
    super.key,
    required this.activeTabIndex,
  });

  @override
  State<TransactionForm> createState() => _TransactionFormState(
        activeTabIndex: activeTabIndex,
      );
}

class _TransactionFormState extends State<TransactionForm> {
  late TextEditingController amountController;
  late TextEditingController catagoryController;
  late TextEditingController accountController;
  late TextEditingController noteController;

  late int activeTabIndex;

  _TransactionFormState({
    required this.activeTabIndex,
  });

  @override
  void initState() {
    amountController = TextEditingController();
    catagoryController = TextEditingController();
    accountController = TextEditingController();
    noteController = TextEditingController();
    super.initState();
  }

  void _confirmFormHandler(BuildContext context, MobXStore store) {
    final isOneOfControllerIsEmpty = amountController.text.isEmpty ||
        catagoryController.text.isEmpty ||
        accountController.text.isEmpty;

    final DateTime now = DateTime.now();
    final String currentTime = DateFormat("hh.mm").format(now);

    if (isOneOfControllerIsEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Alert Title"),
            content: const Text("This is the alert message."),
            actions: [
              BuildButton(
                buttonText: "OK",
                pressedCallback: () {
                  Navigator.of(context).pop('/');
                },
              ),
            ],
          );
        },
      );
      return;
    }

    store.addNewTransaction(
      catagoryController.text.toString(),
      accountController.text.toString(),
      activeTabIndex == 0 ? '+' : '-',
      currentTime,
      Icons.shopping_cart,
      int.parse(amountController.text),
    );
    // TODO saving data to Firebase
    GoRouter.of(context).go('/');
  }

  @override
  Widget build(BuildContext context) {
    final MobXStore store = Provider.of<MobXStore>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 18),
            Label(
                title: 'Sum',
                textEditingController: amountController,
                hintText: "0"),
            const SizedBox(height: 18),
            Label(
              title: 'From',
              textEditingController: accountController,
              hintText: "from which account",
            ),
            const SizedBox(height: 18),
            Label(
                title: 'Catagory',
                textEditingController: catagoryController,
                hintText: "Catagory of transactions"),
            const SizedBox(height: 18),
            Label(
              title: 'Note',
              textEditingController: noteController,
              hintText: "Notes...",
            ),
            const SizedBox(
              height: 18,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: BuildButton(
                buttonText: 'Confirm',
                pressedCallback: () => _confirmFormHandler(context, store),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
