import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class TypeChartDialog extends StatelessWidget {
  final Map<String, int> typeCountMap;

  const TypeChartDialog({super.key, required this.typeCountMap});

  @override
  Widget build(BuildContext context) {
    final dataMap = {
      for (var entry in typeCountMap.entries) entry.key: entry.value.toDouble()
    };

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '성향 통계',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            PieChart(
              dataMap: dataMap,
              chartType: ChartType.ring,
              chartRadius: 200,
              ringStrokeWidth: 40,
              legendOptions: const LegendOptions(
                showLegendsInRow: true,
                legendPosition: LegendPosition.top,
              ),
              chartValuesOptions: const ChartValuesOptions(
                showChartValueBackground: false,
                decimalPlaces: 0,
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('닫기', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
