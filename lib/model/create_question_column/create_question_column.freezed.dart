// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_question_column.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateQuestionColumn {
  String get questionId => throw _privateConstructorUsedError;
  List<String> get answerId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateQuestionColumnCopyWith<CreateQuestionColumn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateQuestionColumnCopyWith<$Res> {
  factory $CreateQuestionColumnCopyWith(CreateQuestionColumn value,
          $Res Function(CreateQuestionColumn) then) =
      _$CreateQuestionColumnCopyWithImpl<$Res, CreateQuestionColumn>;
  @useResult
  $Res call({String questionId, List<String> answerId});
}

/// @nodoc
class _$CreateQuestionColumnCopyWithImpl<$Res,
        $Val extends CreateQuestionColumn>
    implements $CreateQuestionColumnCopyWith<$Res> {
  _$CreateQuestionColumnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? answerId = null,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateQuestionColumnCopyWith<$Res>
    implements $CreateQuestionColumnCopyWith<$Res> {
  factory _$$_CreateQuestionColumnCopyWith(_$_CreateQuestionColumn value,
          $Res Function(_$_CreateQuestionColumn) then) =
      __$$_CreateQuestionColumnCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String questionId, List<String> answerId});
}

/// @nodoc
class __$$_CreateQuestionColumnCopyWithImpl<$Res>
    extends _$CreateQuestionColumnCopyWithImpl<$Res, _$_CreateQuestionColumn>
    implements _$$_CreateQuestionColumnCopyWith<$Res> {
  __$$_CreateQuestionColumnCopyWithImpl(_$_CreateQuestionColumn _value,
      $Res Function(_$_CreateQuestionColumn) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? answerId = null,
  }) {
    return _then(_$_CreateQuestionColumn(
      null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      null == answerId
          ? _value._answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_CreateQuestionColumn extends _CreateQuestionColumn {
  const _$_CreateQuestionColumn(this.questionId, final List<String> answerId)
      : _answerId = answerId,
        super._();

  @override
  final String questionId;
  final List<String> _answerId;
  @override
  List<String> get answerId {
    if (_answerId is EqualUnmodifiableListView) return _answerId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answerId);
  }

  @override
  String toString() {
    return 'CreateQuestionColumn(questionId: $questionId, answerId: $answerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateQuestionColumn &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            const DeepCollectionEquality().equals(other._answerId, _answerId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, questionId, const DeepCollectionEquality().hash(_answerId));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateQuestionColumnCopyWith<_$_CreateQuestionColumn> get copyWith =>
      __$$_CreateQuestionColumnCopyWithImpl<_$_CreateQuestionColumn>(
          this, _$identity);
}

abstract class _CreateQuestionColumn extends CreateQuestionColumn {
  const factory _CreateQuestionColumn(
          final String questionId, final List<String> answerId) =
      _$_CreateQuestionColumn;
  const _CreateQuestionColumn._() : super._();

  @override
  String get questionId;
  @override
  List<String> get answerId;
  @override
  @JsonKey(ignore: true)
  _$$_CreateQuestionColumnCopyWith<_$_CreateQuestionColumn> get copyWith =>
      throw _privateConstructorUsedError;
}
