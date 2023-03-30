// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../store/store.dart';
import '../../constants/constants.dart';
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
  late FirebaseAuth auth = FirebaseAuth.instance;
  late User user = auth.currentUser!;
  late TextEditingController amountController;
  late TextEditingController noteController;

  late int selectedTransactionTypeIndex;
  late int selectedAccountItemIndex;

  late int activeTabIndex;

  _TransactionFormState({
    required this.activeTabIndex,
  });

  @override
  void initState() {
    amountController = TextEditingController();
    selectedTransactionTypeIndex = 0;
    selectedAccountItemIndex = 0;
    noteController = TextEditingController();
    super.initState();
  }

  void _updateSelectedIndex(int activeIndex, String type) {
    if (type == 'account') {
      setState(() {
        selectedAccountItemIndex = activeIndex;
      });
    } else {
      setState(() {
        selectedTransactionTypeIndex = activeIndex;
      });
    }
  }

  void _confirmFormHandler(BuildContext context, MobXStore store) {
    final isAmountControllIsEmpty = amountController.text.isEmpty;

    final DateTime now = DateTime.now();
    final String currentTime = DateFormat("hh.mm").format(now);

    if (isAmountControllIsEmpty) {
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

    final String transactionType = activeTabIndex == 0
        ? incomeList[selectedTransactionTypeIndex]['type']
        : exspenseList[selectedTransactionTypeIndex]['type'];
    final String transactionIcon = activeTabIndex == 0
        ? incomeList[selectedTransactionTypeIndex]['iconName']
        : exspenseList[selectedTransactionTypeIndex]['iconName'];

    store.addNewTransaction(
      transactionType,
      accounts[selectedAccountItemIndex]['type'],
      activeTabIndex == 0 ? '+' : '-',
      currentTime,
      transactionIcon,
      int.parse(amountController.text),
      user,
    );
    GoRouter.of(context).go('/');
  }

  @override
  Widget build(BuildContext context) {
    final MobXStore store = Provider.of<MobXStore>(context);
    final currentList = activeTabIndex == 0 ? incomeList : exspenseList;

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
            InkWell(
              onTap: () => {
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return ModalListView(
                      listType: 'account',
                      isIncome: false,
                      updateSelectedIndex: _updateSelectedIndex,
                    );
                  },
                )
              },
              child: InkWellChild(
                selectedAccountItemIndex: selectedAccountItemIndex,
                selectedTransactionTypeIndex: selectedTransactionTypeIndex,
                type: 'account',
                currentTransactionList: currentList,
              ),
            ),
            const SizedBox(height: 18),
            InkWell(
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return ModalListView(
                      listType: 'catagory',
                      isIncome: activeTabIndex == 0,
                      updateSelectedIndex: _updateSelectedIndex,
                    );
                  },
                );
              },
              child: InkWellChild(
                selectedAccountItemIndex: selectedAccountItemIndex,
                selectedTransactionTypeIndex: selectedTransactionTypeIndex,
                type: 'transaction',
                currentTransactionList: currentList,
              ),
            ),
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
