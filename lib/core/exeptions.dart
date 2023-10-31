class HttpExeption implements Exception {
  final String message;
  final int errorCode;
  HttpExeption({
    required this.message,
    required this.errorCode,
  });
}

class StorageExeption implements Exception {
  final String message;

  StorageExeption({
    required this.message,
  });
}
