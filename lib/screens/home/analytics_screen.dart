import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';
import '../../store/store.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MobXStore store = Provider.of<MobXStore>(context);
    final int sum = store.balance;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 8,
          right: 8,
          bottom: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Balance',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            Text(
              '$sum USD',
              style: const TextStyle(
                fontSize: 26,
              ),
            ),
            const LineChartWidget(),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'The balance shows your total account. This can help you understand how your assets are growing and where you could save',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Expanded(
              child: SegmentedTabController(),
            ),
          ],
        ),
      ),
    );
  }
}
