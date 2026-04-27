/// Base class for all domain/data exceptions in Whispers
sealed class AppException implements Exception {
  const AppException(this.message);
  final String message;
  @override
  String toString() => '$runtimeType: $message';
}

class NetworkException extends AppException {
  const NetworkException(super.message);
}

class ServerException extends AppException {
  const ServerException(super.message, [this.statusCode]);
  final int? statusCode;
  @override
  String toString() => '$runtimeType: $message (Status: $statusCode)';
}

class AuthException extends AppException {
  const AuthException(super.message);
}

class UnknownException extends AppException {
  const UnknownException(super.message);
}
