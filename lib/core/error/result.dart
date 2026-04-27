import 'app_exception.dart';

/// A discriminated union that holds either a success [value] or a [failure].
sealed class Result<T> {
  const Result();

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T? get valueOrNull => isSuccess ? (this as Success<T>).value : null;
  AppException? get errorOrNull => isFailure ? (this as Failure<T>).error : null;

  R fold<R>(
    R Function(T value) onSuccess,
    R Function(AppException error) onFailure,
  ) {
    if (this is Success<T>) {
      return onSuccess((this as Success<T>).value);
    } else {
      return onFailure((this as Failure<T>).error);
    }
  }
}

class Success<T> extends Result<T> {
  const Success(this.value);
  final T value;
}

class Failure<T> extends Result<T> {
  const Failure(this.error);
  final AppException error;
}
