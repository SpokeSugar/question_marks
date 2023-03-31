import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../question/question.dart';

part 'file_loading_model.freezed.dart';

enum LoadType { undifined, csv, json }

@freezed
class FileLoadingState with _$FileLoadingState {
  const FileLoadingState._();

  const factory FileLoadingState({
    @Default(LoadType.undifined) LoadType type,
    List<QuestionModel>? questions,
    Directory? files,
    String? fileErrorText,
    Directory? imageDirectory,
    String? imageErrorText,
  }) = _FileLoadingState;

  String get fileMessage {
    final text = fileErrorText ?? files?.path ?? "Error happend";
    return text;
  }

  String get imageMessage {
    final text =
        imageErrorText ?? imageDirectory?.path ?? "None Image Directory";
    return text;
  }

  bool requiredImageDirectory() {
    return questions
            ?.map((e) => e.imagePath != null)
            .fold<bool>(false, (p, e) => p || e) ??
        false;
  }
}
