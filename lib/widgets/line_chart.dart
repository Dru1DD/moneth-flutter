import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

import '../store/store.dart';
import './widgets.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  @override
  Widget build(BuildContext context) {
    final MobXStore store = Provider.of<MobXStore>(context);
    final List chartValues = store.chartData.toList();

    return Observer(
      builder: (BuildContext context) => GlassMorphism(
        start: 0.2,
        end: 0.4,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 10,
            top: 10,
            bottom: 10,
          ),
          child: SizedBox(
            height: 200,
            width: 400,
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 1,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.white10,
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: Colors.white10,
                      strokeWidth: 1,
                    );
                  },
                ),
                borderData: FlBorderData(
                  show: true,
                  border:
                      Border.all(color: const Color.fromARGB(255, 0, 251, 255)),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: chartValues
                        .asMap()
                        .entries
                        .map((entry) =>
                            FlSpot(entry.key.toDouble(), entry.value))
                        .toList(),
                    isCurved: true,
                    gradient: LinearGradient(
                      colors: [
                        ColorTween(
                          begin: const Color.fromARGB(255, 0, 0, 0),
                          end: const Color.fromARGB(255, 0, 251, 255),
                        ).lerp(0.2)!,
                        ColorTween(
                          begin: const Color.fromARGB(255, 0, 0, 0),
                          end: const Color.fromARGB(255, 0, 251, 255),
                        ).lerp(0.2)!,
                      ],
                    ),
                    barWidth: 5,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          ColorTween(
                            begin: const Color(0xFF50E4FF),
                            end: const Color(0xFF2196F3),
                          ).lerp(0.2)!.withOpacity(0.1),
                          ColorTween(
                            begin: const Color(0xFF50E4FF),
                            end: const Color(0xFF2196F3),
                          ).lerp(0.2)!.withOpacity(0.1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
