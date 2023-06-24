
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_request.freezed.dart';

@freezed
class FileReq with _$FileReq {
  const factory FileReq(String path, String text) = _FileReq;
}
