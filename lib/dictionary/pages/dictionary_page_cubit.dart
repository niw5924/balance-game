import 'package:flutter_bloc/flutter_bloc.dart';
import 'dictionary_page_state.dart';

class DictionaryPageCubit extends Cubit<DictionaryPageState> {
  DictionaryPageCubit() : super(const DictionaryPageState());

  void updateIndex(int newIndex) {
    emit(state.copyWith(currentIndex: newIndex));
  }
}
