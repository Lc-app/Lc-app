import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart' as dio;
part 'request_body.freezed.dart';

@freezed
class RequestBody with _$RequestBody {
  const factory RequestBody.json(Map<String, dynamic> data) = _Json;
  const factory RequestBody.list(List<String> data) = _List;
  const factory RequestBody.text(String data) = _Text;
  const factory RequestBody.upload(dio.FormData data) = _Upload;
}
