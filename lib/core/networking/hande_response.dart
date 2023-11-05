import 'package:vx_project/core/networking/network_response.dart';

typedef SuccessHandle<Model> = Function(Model data);
typedef FailureHandle = Function(String errorMessage);

extension NetworkResponseX on NetworkResponse {
  dynamic on({
    required SuccessHandle successHandle,
    required FailureHandle failureHandle,
  }) {
    if (this is Ok) {
      successHandle.call((this as Ok).data);
    } else {
      final errorMessage = whenOrNull(
        timeOut: (message) => message,
        noInternetAccess: (message) => message,
        noData: (message) => message,
        noAuth: (message) => message,
        noAccess: (message) => message,
        badRequest: (message) => message,
        notFound: (message) => message,
        serverError: (message) => message,
        unknown: (message) => message,
      );
      failureHandle.call(errorMessage ?? '');
    }
  }
}
