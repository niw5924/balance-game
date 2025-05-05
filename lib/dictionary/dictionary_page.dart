import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../models/type_model.dart';
import '../auth/auth_provider.dart';
import '../widgets/error_message_box.dart';
import 'dictionary_page_cubit.dart';
import 'dictionary_page_state.dart';

class DictionaryPage extends StatelessWidget {
  const DictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthProvider>().userId;
    return BlocProvider(
      create: (_) => DictionaryPageCubit()..loadTypeCounts(userId),
      child: const _DictionaryView(),
    );
  }
}

class _DictionaryView extends StatelessWidget {
  const _DictionaryView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DictionaryPageCubit, DictionaryPageState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF101418),
          appBar: AppBar(
            backgroundColor: const Color(0xFF1A1F24),
            title: Text(
              state.viewMode == DictionaryViewMode.card
                  ? '${state.currentIndex + 1} / ${typeList.length}'
                  : '한눈에 보기',
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  state.viewMode == DictionaryViewMode.grid
                      ? Icons.style
                      : Icons.grid_view,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.read<DictionaryPageCubit>().toggleViewMode();
                },
              ),
            ],
          ),
          body: Builder(
            builder: (_) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.error != null) {
                return Center(
                  child: ErrorMessageBox(message: state.error!),
                );
              }

              switch (state.viewMode) {
                case DictionaryViewMode.grid:
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 24),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: typeList.length,
                    itemBuilder: (context, index) {
                      final type = typeList[index];
                      final count = state.typeCounts[type.name] ?? 0;

                      return Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: type.color, width: 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              type.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: type.color,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '+$count',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );

                case DictionaryViewMode.card:
                  return CardSwiper(
                    cardsCount: typeList.length,
                    initialIndex: state.currentIndex,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 48),
                    onSwipe: (prev, next, direction) {
                      context.read<DictionaryPageCubit>().updateIndex(next!);
                      return true;
                    },
                    cardBuilder: (context, index, percentX, percentY) {
                      final type = typeList[index];
                      final count = state.typeCounts[type.name] ?? 0;

                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              child: Image.asset(
                                type.image,
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    type.name,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: type.color,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '+$count',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    type.description,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
              }
            },
          ),
        );
      },
    );
  }
}
