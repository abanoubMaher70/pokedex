import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
  // Factory constructor to create [ServerFailure] from DioException
  factory ServerFailure.fromDioException(DioException dioException) {
    return ServerFailure(_mapDioExceptionToMessage(dioException));
  }

  // Maps DioException to user-friendly error messages
  static String _mapDioExceptionToMessage(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.badResponse:
        return dioException.response?.statusMessage ??
            'Server responded with an error';
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out. Please check your internet.';
      case DioExceptionType.sendTimeout:
        return 'Request took too long to send. Try again.';
      case DioExceptionType.receiveTimeout:
        return 'Server is taking too long to respond.';
      case DioExceptionType.cancel:
        return 'Request was canceled.';
      case DioExceptionType.badCertificate:
        return 'Invalid security certificate detected.';
      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network.';
      case DioExceptionType.unknown:
        return 'Something went wrong. Please try again.';
    }
  }
}
