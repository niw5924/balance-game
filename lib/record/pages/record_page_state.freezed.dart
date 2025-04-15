// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecordPageState {
  bool get isLoading;
  String? get error;
  List<UserPlayRecordModel> get records;

  /// Create a copy of RecordPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecordPageStateCopyWith<RecordPageState> get copyWith =>
      _$RecordPageStateCopyWithImpl<RecordPageState>(
          this as RecordPageState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecordPageState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other.records, records));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error,
      const DeepCollectionEquality().hash(records));

  @override
  String toString() {
    return 'RecordPageState(isLoading: $isLoading, error: $error, records: $records)';
  }
}

/// @nodoc
abstract mixin class $RecordPageStateCopyWith<$Res> {
  factory $RecordPageStateCopyWith(
          RecordPageState value, $Res Function(RecordPageState) _then) =
      _$RecordPageStateCopyWithImpl;
  @useResult
  $Res call({bool isLoading, String? error, List<UserPlayRecordModel> records});
}

/// @nodoc
class _$RecordPageStateCopyWithImpl<$Res>
    implements $RecordPageStateCopyWith<$Res> {
  _$RecordPageStateCopyWithImpl(this._self, this._then);

  final RecordPageState _self;
  final $Res Function(RecordPageState) _then;

  /// Create a copy of RecordPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? records = null,
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
      records: null == records
          ? _self.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<UserPlayRecordModel>,
    ));
  }
}

/// @nodoc

class _RecordPageState implements RecordPageState {
  const _RecordPageState(
      {this.isLoading = true,
      this.error,
      final List<UserPlayRecordModel> records = const []})
      : _records = records;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  final List<UserPlayRecordModel> _records;
  @override
  @JsonKey()
  List<UserPlayRecordModel> get records {
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  /// Create a copy of RecordPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecordPageStateCopyWith<_RecordPageState> get copyWith =>
      __$RecordPageStateCopyWithImpl<_RecordPageState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecordPageState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._records, _records));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error,
      const DeepCollectionEquality().hash(_records));

  @override
  String toString() {
    return 'RecordPageState(isLoading: $isLoading, error: $error, records: $records)';
  }
}

/// @nodoc
abstract mixin class _$RecordPageStateCopyWith<$Res>
    implements $RecordPageStateCopyWith<$Res> {
  factory _$RecordPageStateCopyWith(
          _RecordPageState value, $Res Function(_RecordPageState) _then) =
      __$RecordPageStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool isLoading, String? error, List<UserPlayRecordModel> records});
}

/// @nodoc
class __$RecordPageStateCopyWithImpl<$Res>
    implements _$RecordPageStateCopyWith<$Res> {
  __$RecordPageStateCopyWithImpl(this._self, this._then);

  final _RecordPageState _self;
  final $Res Function(_RecordPageState) _then;

  /// Create a copy of RecordPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? records = null,
  }) {
    return _then(_RecordPageState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      records: null == records
          ? _self._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<UserPlayRecordModel>,
    ));
  }
}

// dart format on
