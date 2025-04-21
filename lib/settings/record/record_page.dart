import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

import '../../auth/auth_provider.dart';
import '../../models/category_model.dart';
import '../../widgets/empty_message_box.dart';
import '../../widgets/error_message_box.dart';
import 'record_detail_page.dart';
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
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocBuilder<RecordPageCubit, RecordPageState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(
              child: ErrorMessageBox(message: state.error!),
            );
          }

          if (state.records.isEmpty) {
            return Center(
              child: EmptyMessageBox(message: '기록이 없습니다.'),
            );
          }

          return ListView.builder(
            itemCount: state.records.length,
            itemBuilder: (context, index) {
              final record = state.records[index];
              final category = categories.firstWhereOrNull(
                (c) => c.title == record.category,
              )!;

              return ListTile(
                leading: Container(
                  width: 6,
                  height: 40,
                  decoration: BoxDecoration(
                    color: category.mainColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                title: Text(
                  record.category,
                  style: TextStyle(color: category.mainColor),
                ),
                subtitle: Text(
                  formatter.format(record.createdAt.toLocal()),
                  style: TextStyle(color: category.backgroundColor),
                ),
                trailing: const Icon(Icons.arrow_forward_ios,
                    color: Colors.grey, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RecordDetailPage(record: record),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
