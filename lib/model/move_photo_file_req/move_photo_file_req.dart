import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../question/question.dart';

part 'move_photo_file_req.freezed.dart';

@freezed
class MovePhotoReq with _$MovePhotoReq {
  const factory MovePhotoReq(String id, Directory document, Directory temp,
      List<QuestionModel> list) = _MovePhotoReq;
}
