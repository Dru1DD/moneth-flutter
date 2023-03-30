import 'package:flutter/material.dart';

import '../constants/constants.dart';

class InkWellChild extends StatelessWidget {
  final int selectedAccountItemIndex;
  final int selectedTransactionTypeIndex;
  final List<Map<String, dynamic>> currentTransactionList;
  final String type;

  const InkWellChild({
    super.key,
    required this.selectedAccountItemIndex,
    required this.selectedTransactionTypeIndex,
    required this.currentTransactionList,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final String text = type == 'account'
        ? accounts[selectedAccountItemIndex]['type']
        : currentTransactionList[selectedTransactionTypeIndex]['type'];
    final IconData icon = type == 'account'
        ? accounts[selectedAccountItemIndex]['icon']
        : currentTransactionList[selectedTransactionTypeIndex]['icon'];
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(text),
            const Spacer(),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
