import 'package:dio/dio.dart';

abstract class AuthError implements Exception {
  final String message;
  final String? code;
  final Object? originalError;

  const AuthError(this.message, {this.code, this.originalError});

  factory AuthError.fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutAuthError();
      case DioExceptionType.connectionError:
        return const NoInternetAuthError();
      case DioExceptionType.badCertificate:
        return const BadCertificateAuthError();
      case DioExceptionType.cancel:
        return const RequestCancelledAuthError();
      case DioExceptionType.badResponse:
        return AuthError._fromStatusCode(error);
      case DioExceptionType.unknown:
        return UnknownDioAuthError(error);
    }
  }

  factory AuthError.fromMessage(String message) {
    return GeneralAuthError(message);
  }

  static AuthError _fromStatusCode(DioException error) {
    final statusCode = error.response?.statusCode;
    final message = _extractMessage(error);

    if (statusCode == null) {
      return GeneralAuthError(message, originalError: error);
    }

    if (statusCode >= 500) {
      return ServerAuthError(
        _defaultMessageForStatusCode(statusCode),
        code: statusCode.toString(),
        originalError: error,
      );
    }

    switch (statusCode) {
      case 400:
        return BadRequestAuthError(message, originalError: error);
      case 401:
        return UnauthorizedAuthError(message, originalError: error);
      case 403:
        return ForbiddenAuthError(message, originalError: error);
      case 404:
        return NotFoundAuthError(message, originalError: error);
      case 409:
        return ConflictAuthError(message, originalError: error);
      case 422:
        return ValidationAuthError(message, originalError: error);
      case 429:
        return RateLimitAuthError(message, originalError: error);
      default:
        return GeneralAuthError(
          message,
          code: statusCode.toString(),
          originalError: error,
        );
    }
  }

  static String _extractMessage(DioException error) {
    final dynamic responseData = error.response?.data;
    final statusCode = error.response?.statusCode;

    if (responseData is Map<String, dynamic>) {
      final dynamic message = responseData['message'] ?? responseData['error'];
      if (message is String && message.trim().isNotEmpty) {
        return message;
      }
    }

    if (responseData is String) {
      final text = responseData.trim();
      if (text.isNotEmpty &&
          text.length < 220 &&
          !_isTechnicalServerText(text)) {
        return text;
      }
    }

    if (error.message != null && error.message!.trim().isNotEmpty) {
      final sanitized = _sanitizeDioTechnicalMessage(error.message!);
      if (sanitized != null) {
        return sanitized;
      }
    }

    return _defaultMessageForStatusCode(statusCode);
  }

  static String? _sanitizeDioTechnicalMessage(String message) {
    final text = message.trim();
    if (text.isEmpty) {
      return null;
    }

    final lower = text.toLowerCase();
    if (lower.contains(
      'this exception was thrown because the response has a status code',
    )) {
      return null;
    }

    if (_isTechnicalServerText(text)) {
      return null;
    }

    if (text.length > 220) {
      return null;
    }

    return text;
  }

  static bool _isTechnicalServerText(String text) {
    final lower = text.toLowerCase();
    return lower.contains('function_invocation_failed') ||
        lower.contains('requestoptions.validatestatus') ||
        lower.contains('status code of') ||
        text.contains('fra1::');
  }

  static String _defaultMessageForStatusCode(int? statusCode) {
    if (statusCode == null) {
      return 'Authentication request failed.';
    }

    switch (statusCode) {
      case 400:
        return 'Invalid request data.';
      case 401:
        return 'Invalid email or password.';
      case 403:
        return 'You are not allowed to perform this action.';
      case 404:
        return 'Requested authentication resource was not found.';
      case 409:
        return 'This account already exists.';
      case 422:
        return 'Please verify your input and try again.';
      case 429:
        return 'Too many attempts. Please try again later.';
      default:
        if (statusCode >= 500) {
          return 'Server error. Please try again later.';
        }
        return 'Authentication request failed.';
    }
  }

  @override
  String toString() {
    return message;
  }

  String get logDetails {
    final buffer = StringBuffer('AuthError: $message');
    if (code != null) {
      buffer.write(' (code: $code)');
    }
    if (originalError != null) {
      buffer.write(' | original: $originalError');
    }
    return buffer.toString();
  }
}

class GeneralAuthError extends AuthError {
  const GeneralAuthError(super.message, {super.code, super.originalError});
}

class BadRequestAuthError extends AuthError {
  const BadRequestAuthError(super.message, {super.originalError})
    : super(code: '400');
}

class UnauthorizedAuthError extends AuthError {
  const UnauthorizedAuthError(super.message, {super.originalError})
    : super(code: '401');
}

class ForbiddenAuthError extends AuthError {
  const ForbiddenAuthError(super.message, {super.originalError})
    : super(code: '403');
}

class NotFoundAuthError extends AuthError {
  const NotFoundAuthError(super.message, {super.originalError})
    : super(code: '404');
}

class ConflictAuthError extends AuthError {
  const ConflictAuthError(super.message, {super.originalError})
    : super(code: '409');
}

class ValidationAuthError extends AuthError {
  const ValidationAuthError(super.message, {super.originalError})
    : super(code: '422');
}

class RateLimitAuthError extends AuthError {
  const RateLimitAuthError(super.message, {super.originalError})
    : super(code: '429');
}

class ServerAuthError extends AuthError {
  const ServerAuthError(super.message, {super.code, super.originalError});
}

class NoInternetAuthError extends AuthError {
  const NoInternetAuthError()
    : super('No internet connection.', code: 'network_error');
}

class TimeoutAuthError extends AuthError {
  const TimeoutAuthError()
    : super(
        'Request timed out. Please check your connection and try again.',
        code: 'timeout',
      );
}

class BadCertificateAuthError extends AuthError {
  const BadCertificateAuthError()
    : super(
        'Could not establish a secure connection to the server.',
        code: 'bad_certificate',
      );
}

class RequestCancelledAuthError extends AuthError {
  const RequestCancelledAuthError()
    : super('Request was cancelled.', code: 'cancelled');
}

class UnknownDioAuthError extends AuthError {
  UnknownDioAuthError(Object error)
    : super(
        'An unexpected network error occurred during authentication.',
        code: 'unknown_dio_error',
        originalError: error,
      );
}
