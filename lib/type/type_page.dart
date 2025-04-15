import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../auth/auth_provider.dart';
import 'type_page_cubit.dart';
import 'type_page_state.dart';

class TypePage extends StatelessWidget {
  const TypePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthProvider>().userId;

    return BlocProvider(
      create: (_) => TypePageCubit()..loadTypeCounts(userId),
      child: const _TypeView(),
    );
  }
}

class _TypeView extends StatelessWidget {
  const _TypeView();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final chartRadius = screenWidth * 0.6;

    return Scaffold(
      backgroundColor: const Color(0xFF101418),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1F24),
        title: const Text(
          '성향',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<TypePageCubit, TypePageState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(
              child: Text(
                '에러: ${state.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (state.typeCounts.isEmpty) {
            return const Center(
              child: Text(
                '성향 데이터가 없습니다.',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          final typeDataMap = {
            for (var entry in state.typeCounts.entries)
              entry.key: entry.value.toDouble()
          };

          final maxCount =
              state.typeCounts.values.reduce((a, b) => a > b ? a : b);
          final mostFrequentTypes = state.typeCounts.entries
              .where((e) => e.value == maxCount)
              .map((e) => e.key)
              .toList();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              children: [
                PieChart(
                  dataMap: typeDataMap,
                  chartType: ChartType.ring,
                  chartRadius: chartRadius,
                  ringStrokeWidth: chartRadius / 5,
                  legendOptions: const LegendOptions(
                    showLegendsInRow: true,
                    legendPosition: LegendPosition.top,
                    legendTextStyle: TextStyle(color: Colors.white),
                  ),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: false,
                    decimalPlaces: 0,
                    chartValueStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      '나는 ${mostFrequentTypes.join(", ")}이에요!',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
