// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return _Settings.fromJson(json);
}

/// @nodoc
mixin _$Settings {
  bool get showResult => throw _privateConstructorUsedError;
  bool get clearSelect => throw _privateConstructorUsedError;
  bool get showCollectNum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res, Settings>;
  @useResult
  $Res call({bool showResult, bool clearSelect, bool showCollectNum});
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res, $Val extends Settings>
    implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showResult = null,
    Object? clearSelect = null,
    Object? showCollectNum = null,
  }) {
    return _then(_value.copyWith(
      showResult: null == showResult
          ? _value.showResult
          : showResult // ignore: cast_nullable_to_non_nullable
              as bool,
      clearSelect: null == clearSelect
          ? _value.clearSelect
          : clearSelect // ignore: cast_nullable_to_non_nullable
              as bool,
      showCollectNum: null == showCollectNum
          ? _value.showCollectNum
          : showCollectNum // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$$_SettingsCopyWith(
          _$_Settings value, $Res Function(_$_Settings) then) =
      __$$_SettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool showResult, bool clearSelect, bool showCollectNum});
}

/// @nodoc
class __$$_SettingsCopyWithImpl<$Res>
    extends _$SettingsCopyWithImpl<$Res, _$_Settings>
    implements _$$_SettingsCopyWith<$Res> {
  __$$_SettingsCopyWithImpl(
      _$_Settings _value, $Res Function(_$_Settings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showResult = null,
    Object? clearSelect = null,
    Object? showCollectNum = null,
  }) {
    return _then(_$_Settings(
      showResult: null == showResult
          ? _value.showResult
          : showResult // ignore: cast_nullable_to_non_nullable
              as bool,
      clearSelect: null == clearSelect
          ? _value.clearSelect
          : clearSelect // ignore: cast_nullable_to_non_nullable
              as bool,
      showCollectNum: null == showCollectNum
          ? _value.showCollectNum
          : showCollectNum // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Settings implements _Settings {
  const _$_Settings(
      {this.showResult = false,
      this.clearSelect = true,
      this.showCollectNum = false});

  factory _$_Settings.fromJson(Map<String, dynamic> json) =>
      _$$_SettingsFromJson(json);

  @override
  @JsonKey()
  final bool showResult;
  @override
  @JsonKey()
  final bool clearSelect;
  @override
  @JsonKey()
  final bool showCollectNum;

  @override
  String toString() {
    return 'Settings(showResult: $showResult, clearSelect: $clearSelect, showCollectNum: $showCollectNum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Settings &&
            (identical(other.showResult, showResult) ||
                other.showResult == showResult) &&
            (identical(other.clearSelect, clearSelect) ||
                other.clearSelect == clearSelect) &&
            (identical(other.showCollectNum, showCollectNum) ||
                other.showCollectNum == showCollectNum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, showResult, clearSelect, showCollectNum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      __$$_SettingsCopyWithImpl<_$_Settings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingsToJson(
      this,
    );
  }
}

abstract class _Settings implements Settings {
  const factory _Settings(
      {final bool showResult,
      final bool clearSelect,
      final bool showCollectNum}) = _$_Settings;

  factory _Settings.fromJson(Map<String, dynamic> json) = _$_Settings.fromJson;

  @override
  bool get showResult;
  @override
  bool get clearSelect;
  @override
  bool get showCollectNum;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      throw _privateConstructorUsedError;
}
