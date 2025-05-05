// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dictionary_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DictionaryPageState {
  bool get isLoading;
  String? get error;
  int get currentIndex;
  Map<String, int> get typeCounts;
  DictionaryViewMode get viewMode;

  /// Create a copy of DictionaryPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DictionaryPageStateCopyWith<DictionaryPageState> get copyWith =>
      _$DictionaryPageStateCopyWithImpl<DictionaryPageState>(
          this as DictionaryPageState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DictionaryPageState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            const DeepCollectionEquality()
                .equals(other.typeCounts, typeCounts) &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error, currentIndex,
      const DeepCollectionEquality().hash(typeCounts), viewMode);

  @override
  String toString() {
    return 'DictionaryPageState(isLoading: $isLoading, error: $error, currentIndex: $currentIndex, typeCounts: $typeCounts, viewMode: $viewMode)';
  }
}

/// @nodoc
abstract mixin class $DictionaryPageStateCopyWith<$Res> {
  factory $DictionaryPageStateCopyWith(
          DictionaryPageState value, $Res Function(DictionaryPageState) _then) =
      _$DictionaryPageStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String? error,
      int currentIndex,
      Map<String, int> typeCounts,
      DictionaryViewMode viewMode});
}

/// @nodoc
class _$DictionaryPageStateCopyWithImpl<$Res>
    implements $DictionaryPageStateCopyWith<$Res> {
  _$DictionaryPageStateCopyWithImpl(this._self, this._then);

  final DictionaryPageState _self;
  final $Res Function(DictionaryPageState) _then;

  /// Create a copy of DictionaryPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? currentIndex = null,
    Object? typeCounts = null,
    Object? viewMode = null,
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
      currentIndex: null == currentIndex
          ? _self.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      typeCounts: null == typeCounts
          ? _self.typeCounts
          : typeCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      viewMode: null == viewMode
          ? _self.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as DictionaryViewMode,
    ));
  }
}

/// @nodoc

class _DictionaryPageState implements DictionaryPageState {
  const _DictionaryPageState(
      {this.isLoading = true,
      this.error,
      this.currentIndex = 0,
      final Map<String, int> typeCounts = const {},
      this.viewMode = DictionaryViewMode.card})
      : _typeCounts = typeCounts;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  @JsonKey()
  final int currentIndex;
  final Map<String, int> _typeCounts;
  @override
  @JsonKey()
  Map<String, int> get typeCounts {
    if (_typeCounts is EqualUnmodifiableMapView) return _typeCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_typeCounts);
  }

  @override
  @JsonKey()
  final DictionaryViewMode viewMode;

  /// Create a copy of DictionaryPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DictionaryPageStateCopyWith<_DictionaryPageState> get copyWith =>
      __$DictionaryPageStateCopyWithImpl<_DictionaryPageState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DictionaryPageState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            const DeepCollectionEquality()
                .equals(other._typeCounts, _typeCounts) &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error, currentIndex,
      const DeepCollectionEquality().hash(_typeCounts), viewMode);

  @override
  String toString() {
    return 'DictionaryPageState(isLoading: $isLoading, error: $error, currentIndex: $currentIndex, typeCounts: $typeCounts, viewMode: $viewMode)';
  }
}

/// @nodoc
abstract mixin class _$DictionaryPageStateCopyWith<$Res>
    implements $DictionaryPageStateCopyWith<$Res> {
  factory _$DictionaryPageStateCopyWith(_DictionaryPageState value,
          $Res Function(_DictionaryPageState) _then) =
      __$DictionaryPageStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? error,
      int currentIndex,
      Map<String, int> typeCounts,
      DictionaryViewMode viewMode});
}

/// @nodoc
class __$DictionaryPageStateCopyWithImpl<$Res>
    implements _$DictionaryPageStateCopyWith<$Res> {
  __$DictionaryPageStateCopyWithImpl(this._self, this._then);

  final _DictionaryPageState _self;
  final $Res Function(_DictionaryPageState) _then;

  /// Create a copy of DictionaryPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? currentIndex = null,
    Object? typeCounts = null,
    Object? viewMode = null,
  }) {
    return _then(_DictionaryPageState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      currentIndex: null == currentIndex
          ? _self.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      typeCounts: null == typeCounts
          ? _self._typeCounts
          : typeCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      viewMode: null == viewMode
          ? _self.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as DictionaryViewMode,
    ));
  }
}

// dart format on
