// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TypePageState {
  bool get isLoading;
  String? get error;
  Map<String, int> get typeCounts;

  /// Create a copy of TypePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TypePageStateCopyWith<TypePageState> get copyWith =>
      _$TypePageStateCopyWithImpl<TypePageState>(
          this as TypePageState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TypePageState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other.typeCounts, typeCounts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error,
      const DeepCollectionEquality().hash(typeCounts));

  @override
  String toString() {
    return 'TypePageState(isLoading: $isLoading, error: $error, typeCounts: $typeCounts)';
  }
}

/// @nodoc
abstract mixin class $TypePageStateCopyWith<$Res> {
  factory $TypePageStateCopyWith(
          TypePageState value, $Res Function(TypePageState) _then) =
      _$TypePageStateCopyWithImpl;
  @useResult
  $Res call({bool isLoading, String? error, Map<String, int> typeCounts});
}

/// @nodoc
class _$TypePageStateCopyWithImpl<$Res>
    implements $TypePageStateCopyWith<$Res> {
  _$TypePageStateCopyWithImpl(this._self, this._then);

  final TypePageState _self;
  final $Res Function(TypePageState) _then;

  /// Create a copy of TypePageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? typeCounts = null,
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
      typeCounts: null == typeCounts
          ? _self.typeCounts
          : typeCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc

class _TypePageState implements TypePageState {
  const _TypePageState(
      {this.isLoading = true,
      this.error,
      final Map<String, int> typeCounts = const {}})
      : _typeCounts = typeCounts;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  final Map<String, int> _typeCounts;
  @override
  @JsonKey()
  Map<String, int> get typeCounts {
    if (_typeCounts is EqualUnmodifiableMapView) return _typeCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_typeCounts);
  }

  /// Create a copy of TypePageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TypePageStateCopyWith<_TypePageState> get copyWith =>
      __$TypePageStateCopyWithImpl<_TypePageState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TypePageState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._typeCounts, _typeCounts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error,
      const DeepCollectionEquality().hash(_typeCounts));

  @override
  String toString() {
    return 'TypePageState(isLoading: $isLoading, error: $error, typeCounts: $typeCounts)';
  }
}

/// @nodoc
abstract mixin class _$TypePageStateCopyWith<$Res>
    implements $TypePageStateCopyWith<$Res> {
  factory _$TypePageStateCopyWith(
          _TypePageState value, $Res Function(_TypePageState) _then) =
      __$TypePageStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool isLoading, String? error, Map<String, int> typeCounts});
}

/// @nodoc
class __$TypePageStateCopyWithImpl<$Res>
    implements _$TypePageStateCopyWith<$Res> {
  __$TypePageStateCopyWithImpl(this._self, this._then);

  final _TypePageState _self;
  final $Res Function(_TypePageState) _then;

  /// Create a copy of TypePageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? typeCounts = null,
  }) {
    return _then(_TypePageState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      typeCounts: null == typeCounts
          ? _self._typeCounts
          : typeCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

// dart format on
