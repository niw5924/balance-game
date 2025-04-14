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
  int get currentIndex;

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
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentIndex);

  @override
  String toString() {
    return 'DictionaryPageState(currentIndex: $currentIndex)';
  }
}

/// @nodoc
abstract mixin class $DictionaryPageStateCopyWith<$Res> {
  factory $DictionaryPageStateCopyWith(
          DictionaryPageState value, $Res Function(DictionaryPageState) _then) =
      _$DictionaryPageStateCopyWithImpl;
  @useResult
  $Res call({int currentIndex});
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
    Object? currentIndex = null,
  }) {
    return _then(_self.copyWith(
      currentIndex: null == currentIndex
          ? _self.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _DictionaryPageState implements DictionaryPageState {
  const _DictionaryPageState({this.currentIndex = 0});

  @override
  @JsonKey()
  final int currentIndex;

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
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentIndex);

  @override
  String toString() {
    return 'DictionaryPageState(currentIndex: $currentIndex)';
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
  $Res call({int currentIndex});
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
    Object? currentIndex = null,
  }) {
    return _then(_DictionaryPageState(
      currentIndex: null == currentIndex
          ? _self.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
