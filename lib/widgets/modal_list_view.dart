import 'package:flutter/material.dart';

import '../constants/constants.dart';
import './glass_widget.dart';

class ModalListView extends StatefulWidget {
  final String listType;
  final bool isIncome;
  final Function(int, String) updateSelectedIndex;

  const ModalListView({
    super.key,
    required this.listType,
    required this.isIncome,
    required this.updateSelectedIndex,
  });

  @override
  State<ModalListView> createState() => _ModalListViewState();
}

class _ModalListViewState extends State<ModalListView> {
  late int indexOfChoosenItem;

  @override
  void initState() {
    indexOfChoosenItem = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentList = widget.listType == 'account'
        ? accounts
        : widget.isIncome
            ? incomeList
            : exspenseList;
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: currentList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 5),
              child: InkWell(
                onTap: () {
                  setState(() {
                    indexOfChoosenItem = index;
                    widget.updateSelectedIndex(
                      indexOfChoosenItem,
                      widget.listType,
                    );
                  });
                },
                child: buildListItem(
                  context,
                  currentList[index]['type'],
                  currentList[index]['icon'],
                  indexOfChoosenItem == index,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildListItem(
    BuildContext context,
    String text,
    IconData icon,
    bool isChosen,
  ) {
    return GlassMorphism(
      start: 0.9,
      end: 0.5,
      color: isChosen ? Colors.orangeAccent : Colors.cyanAccent,
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
