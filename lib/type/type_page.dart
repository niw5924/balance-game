import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../auth/auth_provider.dart';
import '../models/type_model.dart';
import '../widgets/empty_message_box.dart';
import '../widgets/error_message_box.dart';
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
    final chartRadius = MediaQuery.of(context).size.width * 0.6;

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
              child: ErrorMessageBox(message: state.error!),
            );
          }

          if (state.typeCounts.isEmpty) {
            return Center(
              child: EmptyMessageBox(message: '성향 데이터가 없습니다.'),
            );
          }

          final typeDataMap = {
            for (var entry in state.typeCounts.entries)
              entry.key: entry.value.toDouble()
          };

          final colorList = [
            for (var key in state.typeCounts.keys)
              typeList.firstWhere((type) => type.name == key).color
          ];

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
                  colorList: colorList,
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
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: '나는 ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          for (int i = 0;
                              i < mostFrequentTypes.length;
                              i++) ...[
                            TextSpan(
                              text: mostFrequentTypes[i],
                              style: TextStyle(
                                color: typeList
                                    .firstWhere((type) =>
                                        type.name == mostFrequentTypes[i])
                                    .color,
                                fontSize: 18,
                              ),
                            ),
                            if (i < mostFrequentTypes.length - 1)
                              const TextSpan(
                                text: ', ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                          ],
                          const TextSpan(
                            text: '이에요!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
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
