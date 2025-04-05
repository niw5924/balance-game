// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_game_play_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BalanceGamePlayPageState {
  bool get isLoading;
  String? get error;
  Category? get category;
  List<Question> get questions;
  int get currentIndex;
  Map<int, int> get selectedAnswers;
  BalanceGamePlayStatus get status;

  /// Create a copy of BalanceGamePlayPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BalanceGamePlayPageStateCopyWith<BalanceGamePlayPageState> get copyWith =>
      _$BalanceGamePlayPageStateCopyWithImpl<BalanceGamePlayPageState>(
          this as BalanceGamePlayPageState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BalanceGamePlayPageState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other.questions, questions) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            const DeepCollectionEquality()
                .equals(other.selectedAnswers, selectedAnswers) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      error,
      category,
      const DeepCollectionEquality().hash(questions),
      currentIndex,
      const DeepCollectionEquality().hash(selectedAnswers),
      status);

  @override
  String toString() {
    return 'BalanceGamePlayPageState(isLoading: $isLoading, error: $error, category: $category, questions: $questions, currentIndex: $currentIndex, selectedAnswers: $selectedAnswers, status: $status)';
  }
}

/// @nodoc
abstract mixin class $BalanceGamePlayPageStateCopyWith<$Res> {
  factory $BalanceGamePlayPageStateCopyWith(BalanceGamePlayPageState value,
          $Res Function(BalanceGamePlayPageState) _then) =
      _$BalanceGamePlayPageStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String? error,
      Category? category,
      List<Question> questions,
      int currentIndex,
      Map<int, int> selectedAnswers,
      BalanceGamePlayStatus status});
}

/// @nodoc
class _$BalanceGamePlayPageStateCopyWithImpl<$Res>
    implements $BalanceGamePlayPageStateCopyWith<$Res> {
  _$BalanceGamePlayPageStateCopyWithImpl(this._self, this._then);

  final BalanceGamePlayPageState _self;
  final $Res Function(BalanceGamePlayPageState) _then;

  /// Create a copy of BalanceGamePlayPageState
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
    Object? status = null,
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
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as BalanceGamePlayStatus,
    ));
  }
}

/// @nodoc

class _BalanceGamePlayPageState implements BalanceGamePlayPageState {
  const _BalanceGamePlayPageState(
      {this.isLoading = true,
      this.error,
      this.category,
      final List<Question> questions = const [],
      this.currentIndex = 0,
      final Map<int, int> selectedAnswers = const {},
      this.status = BalanceGamePlayStatus.inProgress})
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

  @override
  @JsonKey()
  final BalanceGamePlayStatus status;

  /// Create a copy of BalanceGamePlayPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BalanceGamePlayPageStateCopyWith<_BalanceGamePlayPageState> get copyWith =>
      __$BalanceGamePlayPageStateCopyWithImpl<_BalanceGamePlayPageState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BalanceGamePlayPageState &&
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
                .equals(other._selectedAnswers, _selectedAnswers) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      error,
      category,
      const DeepCollectionEquality().hash(_questions),
      currentIndex,
      const DeepCollectionEquality().hash(_selectedAnswers),
      status);

  @override
  String toString() {
    return 'BalanceGamePlayPageState(isLoading: $isLoading, error: $error, category: $category, questions: $questions, currentIndex: $currentIndex, selectedAnswers: $selectedAnswers, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$BalanceGamePlayPageStateCopyWith<$Res>
    implements $BalanceGamePlayPageStateCopyWith<$Res> {
  factory _$BalanceGamePlayPageStateCopyWith(_BalanceGamePlayPageState value,
          $Res Function(_BalanceGamePlayPageState) _then) =
      __$BalanceGamePlayPageStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? error,
      Category? category,
      List<Question> questions,
      int currentIndex,
      Map<int, int> selectedAnswers,
      BalanceGamePlayStatus status});
}

/// @nodoc
class __$BalanceGamePlayPageStateCopyWithImpl<$Res>
    implements _$BalanceGamePlayPageStateCopyWith<$Res> {
  __$BalanceGamePlayPageStateCopyWithImpl(this._self, this._then);

  final _BalanceGamePlayPageState _self;
  final $Res Function(_BalanceGamePlayPageState) _then;

  /// Create a copy of BalanceGamePlayPageState
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
    Object? status = null,
  }) {
    return _then(_BalanceGamePlayPageState(
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
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as BalanceGamePlayStatus,
    ));
  }
}

// dart format on
