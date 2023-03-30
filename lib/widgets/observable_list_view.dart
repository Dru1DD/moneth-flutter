import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

import '../constants/constants.dart';
import './widgets.dart';

class ObservableListView extends StatelessWidget {
  final List transactionList;

  const ObservableListView({
    super.key,
    required this.transactionList,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => transactionList.isEmpty
          ? const Text('No one transaction')
          : ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: transactionList.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      context.push(
                        '/transaction-details/$index',
                        extra: {
                          'id': index,
                        },
                      );
                    },
                    child: TransactionItem(
                      cardType: transactionList[index]['cardType'],
                      catagory: transactionList[index]['catagory'],
                      transactionType: transactionList[index]
                          ['transactionType'],
                      transactionTime: transactionList[index]
                          ['transactionTime'],
                      transactionIcon:
                          iconMap[transactionList[index]['transactionIcon']]!,
                      amount: transactionList[index]['amount'],
                      isShowArrow: true,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
