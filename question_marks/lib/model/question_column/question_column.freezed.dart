// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_column.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionColumn _$QuestionColumnFromJson(Map<String, dynamic> json) {
  return _QuestionColumn.fromJson(json);
}

/// @nodoc
mixin _$QuestionColumn {
  String get title => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionColumnCopyWith<QuestionColumn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionColumnCopyWith<$Res> {
  factory $QuestionColumnCopyWith(
          QuestionColumn value, $Res Function(QuestionColumn) then) =
      _$QuestionColumnCopyWithImpl<$Res, QuestionColumn>;
  @useResult
  $Res call({String title, String id});
}

/// @nodoc
class _$QuestionColumnCopyWithImpl<$Res, $Val extends QuestionColumn>
    implements $QuestionColumnCopyWith<$Res> {
  _$QuestionColumnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionColumnCopyWith<$Res>
    implements $QuestionColumnCopyWith<$Res> {
  factory _$$_QuestionColumnCopyWith(
          _$_QuestionColumn value, $Res Function(_$_QuestionColumn) then) =
      __$$_QuestionColumnCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String id});
}

/// @nodoc
class __$$_QuestionColumnCopyWithImpl<$Res>
    extends _$QuestionColumnCopyWithImpl<$Res, _$_QuestionColumn>
    implements _$$_QuestionColumnCopyWith<$Res> {
  __$$_QuestionColumnCopyWithImpl(
      _$_QuestionColumn _value, $Res Function(_$_QuestionColumn) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = null,
  }) {
    return _then(_$_QuestionColumn(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionColumn implements _QuestionColumn {
  const _$_QuestionColumn({required this.title, required this.id});

  factory _$_QuestionColumn.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionColumnFromJson(json);

  @override
  final String title;
  @override
  final String id;

  @override
  String toString() {
    return 'QuestionColumn(title: $title, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionColumn &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionColumnCopyWith<_$_QuestionColumn> get copyWith =>
      __$$_QuestionColumnCopyWithImpl<_$_QuestionColumn>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionColumnToJson(
      this,
    );
  }
}

abstract class _QuestionColumn implements QuestionColumn {
  const factory _QuestionColumn(
      {required final String title,
      required final String id}) = _$_QuestionColumn;

  factory _QuestionColumn.fromJson(Map<String, dynamic> json) =
      _$_QuestionColumn.fromJson;

  @override
  String get title;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionColumnCopyWith<_$_QuestionColumn> get copyWith =>
      throw _privateConstructorUsedError;
}
