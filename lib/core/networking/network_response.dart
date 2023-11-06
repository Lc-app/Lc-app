import 'package:freezed_annotation/freezed_annotation.dart';
part 'network_response.freezed.dart';

@freezed
class NetworkResponse<Model> with _$NetworkResponse<Model> {
  const factory NetworkResponse.ok(Model data) = Ok;

  const factory NetworkResponse.timeOut(String message) = TimeOut;

  const factory NetworkResponse.noInternetAccess(String message) =
      NoInternetAccess;
  const factory NetworkResponse.noData(String message) = NoData; //204
  const factory NetworkResponse.noAuth(String message) = NoAuth; //401
  const factory NetworkResponse.noAccess(String message) = NoAccess; //403
  const factory NetworkResponse.badRequest(String message) = BadRequest; //400
  const factory NetworkResponse.notFound(String message) = NotFound; //404
  const factory NetworkResponse.serverError(String message) = ServerError; //500
  const factory NetworkResponse.unknown(String message) = Unknown; //unknow
}
