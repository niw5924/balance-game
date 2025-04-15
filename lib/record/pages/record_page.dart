import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

import '../../auth/auth_provider.dart';
import '../../balance_game/models/category_model.dart';
import 'record_page_cubit.dart';
import 'record_page_state.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthProvider>().userId;

    return BlocProvider(
      create: (_) => RecordPageCubit()..loadRecords(userId),
      child: const _RecordView(),
    );
  }
}

class _RecordView extends StatelessWidget {
  const _RecordView();

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('yyyy-MM-dd HH:mm');

    return Scaffold(
      backgroundColor: const Color(0xFF101418),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1F24),
        title: const Text(
          '기록',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<RecordPageCubit, RecordPageState>(
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

          if (state.records.isEmpty) {
            return const Center(
              child: Text(
                '기록이 없습니다.',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return ListView.separated(
            itemCount: state.records.length,
            separatorBuilder: (_, __) => const Divider(color: Colors.grey),
            itemBuilder: (context, index) {
              final record = state.records[index];
              final category = categories.firstWhereOrNull(
                (c) => c.title == record.category,
              )!;

              return ListTile(
                leading: const Icon(Icons.play_arrow, color: Colors.white),
                title: Text(
                  record.category,
                  style: TextStyle(color: category.mainColor),
                ),
                subtitle: Text(
                  formatter.format(record.createdAt.toLocal()),
                  style: TextStyle(color: category.backgroundColor),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
