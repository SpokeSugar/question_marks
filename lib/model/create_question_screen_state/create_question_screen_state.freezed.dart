// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_question_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateQuestionScreenState {
  String? get title => throw _privateConstructorUsedError;
  List<QuestionModel> get questionIDs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateQuestionScreenStateCopyWith<CreateQuestionScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateQuestionScreenStateCopyWith<$Res> {
  factory $CreateQuestionScreenStateCopyWith(CreateQuestionScreenState value,
          $Res Function(CreateQuestionScreenState) then) =
      _$CreateQuestionScreenStateCopyWithImpl<$Res, CreateQuestionScreenState>;
  @useResult
  $Res call({String? title, List<QuestionModel> questionIDs});
}

/// @nodoc
class _$CreateQuestionScreenStateCopyWithImpl<$Res,
        $Val extends CreateQuestionScreenState>
    implements $CreateQuestionScreenStateCopyWith<$Res> {
  _$CreateQuestionScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? questionIDs = null,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      questionIDs: null == questionIDs
          ? _value.questionIDs
          : questionIDs // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateQuestionScreenStateCopyWith<$Res>
    implements $CreateQuestionScreenStateCopyWith<$Res> {
  factory _$$_CreateQuestionScreenStateCopyWith(
          _$_CreateQuestionScreenState value,
          $Res Function(_$_CreateQuestionScreenState) then) =
      __$$_CreateQuestionScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, List<QuestionModel> questionIDs});
}

/// @nodoc
class __$$_CreateQuestionScreenStateCopyWithImpl<$Res>
    extends _$CreateQuestionScreenStateCopyWithImpl<$Res,
        _$_CreateQuestionScreenState>
    implements _$$_CreateQuestionScreenStateCopyWith<$Res> {
  __$$_CreateQuestionScreenStateCopyWithImpl(
      _$_CreateQuestionScreenState _value,
      $Res Function(_$_CreateQuestionScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? questionIDs = null,
  }) {
    return _then(_$_CreateQuestionScreenState(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      questionIDs: null == questionIDs
          ? _value._questionIDs
          : questionIDs // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
    ));
  }
}

/// @nodoc

class _$_CreateQuestionScreenState extends _CreateQuestionScreenState {
  const _$_CreateQuestionScreenState(
      {this.title, final List<QuestionModel> questionIDs = const []})
      : _questionIDs = questionIDs,
        super._();

  @override
  final String? title;
  final List<QuestionModel> _questionIDs;
  @override
  @JsonKey()
  List<QuestionModel> get questionIDs {
    if (_questionIDs is EqualUnmodifiableListView) return _questionIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionIDs);
  }

  @override
  String toString() {
    return 'CreateQuestionScreenState(title: $title, questionIDs: $questionIDs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateQuestionScreenState &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._questionIDs, _questionIDs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_questionIDs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateQuestionScreenStateCopyWith<_$_CreateQuestionScreenState>
      get copyWith => __$$_CreateQuestionScreenStateCopyWithImpl<
          _$_CreateQuestionScreenState>(this, _$identity);
}

abstract class _CreateQuestionScreenState extends CreateQuestionScreenState {
  const factory _CreateQuestionScreenState(
      {final String? title,
      final List<QuestionModel> questionIDs}) = _$_CreateQuestionScreenState;
  const _CreateQuestionScreenState._() : super._();

  @override
  String? get title;
  @override
  List<QuestionModel> get questionIDs;
  @override
  @JsonKey(ignore: true)
  _$$_CreateQuestionScreenStateCopyWith<_$_CreateQuestionScreenState>
      get copyWith => throw _privateConstructorUsedError;
}
