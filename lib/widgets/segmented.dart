// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../store/store.dart';
import 'widgets.dart';

class SegmentedTabController extends StatefulWidget {
  const SegmentedTabController({Key? key}) : super(key: key);

  @override
  _SegmentedTabControllerState createState() => _SegmentedTabControllerState();
}

enum Segment { income, exspense }

class _SegmentedTabControllerState extends State<SegmentedTabController> {
  late Segment currentSegment;

  @override
  void initState() {
    currentSegment = Segment.income;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MobXStore store = Provider.of<MobXStore>(context);
    final incomeList = store.incomeList;
    final exspanseList = store.exspanseList;
    return Column(
      children: [
        SegmentedButton(
          segments: const <ButtonSegment<Segment>>[
            ButtonSegment<Segment>(
              value: Segment.income,
              label: Text('Income'),
              icon: Icon(Icons.add),
            ),
            ButtonSegment<Segment>(
                value: Segment.exspense,
                label: Text('Exspense'),
                icon: Icon(Icons.remove)),
          ],
          selected: <Segment>{currentSegment},
          onSelectionChanged: (selection) {
            setState(() {
              currentSegment = selection.first;
            });
          },
        ),
        const SizedBox(height: 25),
        Observer(
          builder: (BuildContext context) => currentSegment == Segment.income
              ? buildListView(context, incomeList)
              : buildListView(context, exspanseList),
        ),
      ],
    );
  }

  Widget buildListView(BuildContext context, List transactionList) {
    return SingleChildScrollView(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: transactionList.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(8),
          child: TransactionItem(
            cardType: transactionList[index]['cardType'],
            catagory: transactionList[index]['catagory'],
            transactionTime: transactionList[index]['transactionTime'],
            transactionIcon: transactionList[index]['transactionIcon'],
            transactionType: transactionList[index]['transactionType'],
            amount: transactionList[index]['amount'],
            isShowArrow: false,
          ),
        ),
      ),
    );
  }
}
