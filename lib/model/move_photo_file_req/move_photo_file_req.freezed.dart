// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'move_photo_file_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovePhotoReq {
  String get id => throw _privateConstructorUsedError;
  Directory get document => throw _privateConstructorUsedError;
  Directory get temp => throw _privateConstructorUsedError;
  List<QuestionModel> get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovePhotoReqCopyWith<MovePhotoReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovePhotoReqCopyWith<$Res> {
  factory $MovePhotoReqCopyWith(
          MovePhotoReq value, $Res Function(MovePhotoReq) then) =
      _$MovePhotoReqCopyWithImpl<$Res, MovePhotoReq>;
  @useResult
  $Res call(
      {String id,
      Directory document,
      Directory temp,
      List<QuestionModel> list});
}

/// @nodoc
class _$MovePhotoReqCopyWithImpl<$Res, $Val extends MovePhotoReq>
    implements $MovePhotoReqCopyWith<$Res> {
  _$MovePhotoReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? document = null,
    Object? temp = null,
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      document: null == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as Directory,
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as Directory,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovePhotoReqCopyWith<$Res>
    implements $MovePhotoReqCopyWith<$Res> {
  factory _$$_MovePhotoReqCopyWith(
          _$_MovePhotoReq value, $Res Function(_$_MovePhotoReq) then) =
      __$$_MovePhotoReqCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Directory document,
      Directory temp,
      List<QuestionModel> list});
}

/// @nodoc
class __$$_MovePhotoReqCopyWithImpl<$Res>
    extends _$MovePhotoReqCopyWithImpl<$Res, _$_MovePhotoReq>
    implements _$$_MovePhotoReqCopyWith<$Res> {
  __$$_MovePhotoReqCopyWithImpl(
      _$_MovePhotoReq _value, $Res Function(_$_MovePhotoReq) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? document = null,
    Object? temp = null,
    Object? list = null,
  }) {
    return _then(_$_MovePhotoReq(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as Directory,
      null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as Directory,
      null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
    ));
  }
}

/// @nodoc

class _$_MovePhotoReq implements _MovePhotoReq {
  const _$_MovePhotoReq(
      this.id, this.document, this.temp, final List<QuestionModel> list)
      : _list = list;

  @override
  final String id;
  @override
  final Directory document;
  @override
  final Directory temp;
  final List<QuestionModel> _list;
  @override
  List<QuestionModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'MovePhotoReq(id: $id, document: $document, temp: $temp, list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovePhotoReq &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.document, document) ||
                other.document == document) &&
            (identical(other.temp, temp) || other.temp == temp) &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, document, temp,
      const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovePhotoReqCopyWith<_$_MovePhotoReq> get copyWith =>
      __$$_MovePhotoReqCopyWithImpl<_$_MovePhotoReq>(this, _$identity);
}

abstract class _MovePhotoReq implements MovePhotoReq {
  const factory _MovePhotoReq(final String id, final Directory document,
      final Directory temp, final List<QuestionModel> list) = _$_MovePhotoReq;

  @override
  String get id;
  @override
  Directory get document;
  @override
  Directory get temp;
  @override
  List<QuestionModel> get list;
  @override
  @JsonKey(ignore: true)
  _$$_MovePhotoReqCopyWith<_$_MovePhotoReq> get copyWith =>
      throw _privateConstructorUsedError;
}
