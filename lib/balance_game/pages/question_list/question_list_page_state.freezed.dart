// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_list_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuestionListPageState {
  bool get isLoading;
  String? get error;
  Category? get category;
  List<Question> get questions;
  int get currentIndex;
  Map<int, int> get selectedAnswers;

  /// Create a copy of QuestionListPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuestionListPageStateCopyWith<QuestionListPageState> get copyWith =>
      _$QuestionListPageStateCopyWithImpl<QuestionListPageState>(
          this as QuestionListPageState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuestionListPageState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other.questions, questions) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            const DeepCollectionEquality()
                .equals(other.selectedAnswers, selectedAnswers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      error,
      category,
      const DeepCollectionEquality().hash(questions),
      currentIndex,
      const DeepCollectionEquality().hash(selectedAnswers));

  @override
  String toString() {
    return 'QuestionListPageState(isLoading: $isLoading, error: $error, category: $category, questions: $questions, currentIndex: $currentIndex, selectedAnswers: $selectedAnswers)';
  }
}

/// @nodoc
abstract mixin class $QuestionListPageStateCopyWith<$Res> {
  factory $QuestionListPageStateCopyWith(QuestionListPageState value,
          $Res Function(QuestionListPageState) _then) =
      _$QuestionListPageStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String? error,
      Category? category,
      List<Question> questions,
      int currentIndex,
      Map<int, int> selectedAnswers});
}

/// @nodoc
class _$QuestionListPageStateCopyWithImpl<$Res>
    implements $QuestionListPageStateCopyWith<$Res> {
  _$QuestionListPageStateCopyWithImpl(this._self, this._then);

  final QuestionListPageState _self;
  final $Res Function(QuestionListPageState) _then;

  /// Create a copy of QuestionListPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? category = freezed,
    Object? questions = null,
    Object? currentIndex = null,
    Object? selectedAnswers = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      questions: null == questions
          ? _self.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      currentIndex: null == currentIndex
          ? _self.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedAnswers: null == selectedAnswers
          ? _self.selectedAnswers
          : selectedAnswers // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ));
  }
}

/// @nodoc

class _QuestionListPageState implements QuestionListPageState {
  const _QuestionListPageState(
      {this.isLoading = true,
      this.error,
      this.category,
      final List<Question> questions = const [],
      this.currentIndex = 0,
      final Map<int, int> selectedAnswers = const {}})
      : _questions = questions,
        _selectedAnswers = selectedAnswers;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  final Category? category;
  final List<Question> _questions;
  @override
  @JsonKey()
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  @JsonKey()
  final int currentIndex;
  final Map<int, int> _selectedAnswers;
  @override
  @JsonKey()
  Map<int, int> get selectedAnswers {
    if (_selectedAnswers is EqualUnmodifiableMapView) return _selectedAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedAnswers);
  }

  /// Create a copy of QuestionListPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuestionListPageStateCopyWith<_QuestionListPageState> get copyWith =>
      __$QuestionListPageStateCopyWithImpl<_QuestionListPageState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuestionListPageState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            const DeepCollectionEquality()
                .equals(other._selectedAnswers, _selectedAnswers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      error,
      category,
      const DeepCollectionEquality().hash(_questions),
      currentIndex,
      const DeepCollectionEquality().hash(_selectedAnswers));

  @override
  String toString() {
    return 'QuestionListPageState(isLoading: $isLoading, error: $error, category: $category, questions: $questions, currentIndex: $currentIndex, selectedAnswers: $selectedAnswers)';
  }
}

/// @nodoc
abstract mixin class _$QuestionListPageStateCopyWith<$Res>
    implements $QuestionListPageStateCopyWith<$Res> {
  factory _$QuestionListPageStateCopyWith(_QuestionListPageState value,
          $Res Function(_QuestionListPageState) _then) =
      __$QuestionListPageStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? error,
      Category? category,
      List<Question> questions,
      int currentIndex,
      Map<int, int> selectedAnswers});
}

/// @nodoc
class __$QuestionListPageStateCopyWithImpl<$Res>
    implements _$QuestionListPageStateCopyWith<$Res> {
  __$QuestionListPageStateCopyWithImpl(this._self, this._then);

  final _QuestionListPageState _self;
  final $Res Function(_QuestionListPageState) _then;

  /// Create a copy of QuestionListPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? category = freezed,
    Object? questions = null,
    Object? currentIndex = null,
    Object? selectedAnswers = null,
  }) {
    return _then(_QuestionListPageState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      questions: null == questions
          ? _self._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      currentIndex: null == currentIndex
          ? _self.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedAnswers: null == selectedAnswers
          ? _self._selectedAnswers
          : selectedAnswers // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ));
  }
}

// dart format on
