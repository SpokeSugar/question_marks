typedef ResultSuccessCallback<S, T> = T Function(S success);
typedef ResultFailureCallback<E extends Exception, T> = T Function(E function);

sealed class Result<S, E extends Exception> {
  const Result();

  T then<T>(ResultSuccessCallback<S, T> success,
      ResultFailureCallback<E, T> failure) {
    if (this is Success<S, E>) {
      return success.call((this as Success<S, E>).value);
    }
    if (this is Failure<S, E>) {
      return failure.call((this as Failure<S, E>).exception);
    }
    throw UnintentionalResultException();
  }
}

final class Success<S, E extends Exception> extends Result<S, E> {
  const Success(this.value);

  final S value;
}

final class Failure<S, E extends Exception> extends Result<S, E> {
  const Failure(this.exception);

  final E exception;
}

class UnintentionalResultException implements Exception {}
