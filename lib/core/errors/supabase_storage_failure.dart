import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseStorageFailure {
  final String message;
  final String? code;
  final Object? originalError;

  const SupabaseStorageFailure(this.message, {this.code, this.originalError});

  @override
  String toString() {
    final buffer = StringBuffer('StorageFailure: $message');
    if (code != null) buffer.write(' (code: $code)');
    return buffer.toString();
  }
}

class StorageFailure extends SupabaseStorageFailure {
  const StorageFailure(super.message, {super.code, super.originalError});

  factory StorageFailure.fromException(Object error) {
    if (error is StorageException) {
      return StorageFailure._fromStorageException(error);
    }

    if (error is AuthException) {
      return AuthRelatedStorageFailure.fromAuthException(error);
    }

    if (error is PostgrestException) {
      return DatabaseRelatedStorageFailure.fromPostgrestException(error);
    }

    return StorageFailure._fromGenericError(error);
  }

  factory StorageFailure._fromStorageException(StorageException e) {
    final statusCode = e.statusCode; // String?
    final message = e.message;

    if (statusCode == null) {
      return StorageFailure('Storage error: $message', originalError: e);
    }

    final codeAsInt = int.tryParse(statusCode) ?? 0;

    if (codeAsInt >= 500) {
      return ServerStorageFailure(message, code: statusCode);
    }

    switch (statusCode) {
      case '401':
      case '403':
        return UnauthorizedStorageAccess(message, code: statusCode);
      case '404':
        return FileNotFoundFailure(message, originalError: e);
      case '409':
        return ConflictFailure(message, originalError: e);
      case '413':
        return FileTooLargeFailure(message, originalError: e);
      case '429':
        return RateLimitExceededFailure(message, originalError: e);
      default:
        return StorageFailure(
          'Storage error: $message',
          code: statusCode,
          originalError: e,
        );
    }
  }

  factory StorageFailure._fromGenericError(Object error) {
    final errorStr = error.toString().toLowerCase();

    if (errorStr.contains('socket') || errorStr.contains('connection')) {
      return const NoInternetStorageFailure();
    }

    if (errorStr.contains('timeout')) {
      return const TimeoutStorageFailure();
    }

    return UnexpectedStorageFailure(error);
  }
}

class FileNotFoundFailure extends StorageFailure {
  const FileNotFoundFailure(super.message, {super.originalError})
    : super(code: '404');
}

class UnauthorizedStorageAccess extends StorageFailure {
  const UnauthorizedStorageAccess(
    super.message, {
    super.code,
    super.originalError,
  });
}

class FileTooLargeFailure extends StorageFailure {
  const FileTooLargeFailure(super.message, {super.originalError})
    : super(code: '413');
}

class ConflictFailure extends StorageFailure {
  const ConflictFailure(super.message, {super.originalError})
    : super(code: '409');
}

class RateLimitExceededFailure extends StorageFailure {
  const RateLimitExceededFailure(super.message, {super.originalError})
    : super(code: '429');
}

class ServerStorageFailure extends StorageFailure {
  const ServerStorageFailure(super.message, {super.code, super.originalError});
}

class NoInternetStorageFailure extends StorageFailure {
  const NoInternetStorageFailure()
    : super(
        'No internet connection. Please check your network and try again.',
        code: 'network_error',
      );
}

class TimeoutStorageFailure extends StorageFailure {
  const TimeoutStorageFailure()
    : super(
        'Request timed out. Please check your connection and try again.',
        code: 'timeout',
      );
}

class UnexpectedStorageFailure extends StorageFailure {
  UnexpectedStorageFailure(Object error)
    : super(
        'An unexpected error occurred while accessing storage.',
        originalError: error,
      );
}

class AuthRelatedStorageFailure extends StorageFailure {
  const AuthRelatedStorageFailure(
    super.message, {
    super.code,
    super.originalError,
  });

  factory AuthRelatedStorageFailure.fromAuthException(AuthException e) {
    return AuthRelatedStorageFailure(
      'Authentication error: ${e.message}',
      code: e.code,
      originalError: e,
    );
  }
}

class DatabaseRelatedStorageFailure extends StorageFailure {
  const DatabaseRelatedStorageFailure(
    super.message, {
    super.code,
    super.originalError,
  });

  factory DatabaseRelatedStorageFailure.fromPostgrestException(
    PostgrestException e,
  ) {
    return DatabaseRelatedStorageFailure(
      'Permission/policy error: ${e.message}',
      code: e.code,
      originalError: e,
    );
  }
}
