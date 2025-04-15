import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../models/type_model.dart';

class TypeChartDialog extends StatelessWidget {
  final Map<String, int> typeCountMap;

  const TypeChartDialog({
    super.key,
    required this.typeCountMap,
  });

  @override
  Widget build(BuildContext context) {
    final dataMap = {
      for (var entry in typeCountMap.entries) entry.key: entry.value.toDouble()
    };

    final colorList = [
      for (var key in typeCountMap.keys)
        typeList.firstWhere((type) => type.name == key).color
    ];

    final chartRadius = MediaQuery.of(context).size.width * 0.4;

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
              chartRadius: chartRadius,
              ringStrokeWidth: chartRadius / 5,
              colorList: colorList,
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
              child: const Text(
                '닫기',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
