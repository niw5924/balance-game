import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../models/type_model.dart';
import '../../auth/auth_provider.dart';
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
        final auth = context.watch<AuthProvider>();

        return Scaffold(
          backgroundColor: const Color(0xFF101418),
          appBar: AppBar(
            backgroundColor: const Color(0xFF1A1F24),
            title: Text(
              '${state.currentIndex + 1} / ${typeList.length}',
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
          ),
          body: Builder(
            builder: (_) {
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

              return CardSwiper(
                cardsCount: typeList.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 48),
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
                            auth.isLoggedIn
                                ? type.image
                                : 'assets/images/type_not_logged_in.png',
                            height: 300,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: auth.isLoggedIn
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      type.name,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightBlue,
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
                                )
                              : const Center(
                                  child: Text(
                                    '로그인이 필요합니다',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
