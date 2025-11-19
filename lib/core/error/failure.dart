import 'package:dio/dio.dart';
import 'package:easacc_flutter_task/core/prefs/app_preferences.dart';
import 'package:easacc_flutter_task/generated/l10n.dart';

/// Base class for all failures
abstract class Failure {
  final String message;
  const Failure(this.message);
}

/// Handles all server/network related errors from Dio
class ServerFailure extends Failure {
  const ServerFailure(super.message);

  /// Factory constructor to handle Dio errors gracefully
  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(S.current.connectionTimeout);

      case DioExceptionType.sendTimeout:
        return ServerFailure(S.current.sendTimeout);

      case DioExceptionType.receiveTimeout:
        return ServerFailure(S.current.receiveTimeout);

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure(S.current.requestCanceled);

      case DioExceptionType.connectionError:
        return ServerFailure(S.current.noInternetConnection);

      case DioExceptionType.unknown:
        if (dioException.message?.contains('SocketException') ?? false) {
          return ServerFailure(S.current.noInternetConnection);
        }
        return ServerFailure(S.current.unexpectedError);

      default:
        return ServerFailure(S.current.generalError);
    }
  }

  /// Factory constructor to handle API response codes
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    final message = response is Map<String, dynamic>
        ? response['message']
        : null;

    switch (statusCode) {
      case 400:
      case 403:
      case 404:
      case 406:
      case 409:
        return ServerFailure(message ?? S.current.generalError);

      case 401:
        if (message == 'Unauthorized') {
          AppPreference.clearUserToken();
          // You can trigger navigation to login here using your NavigationService if desired
          return ServerFailure(S.current.unauthorized);
        }
        return ServerFailure(message ?? S.current.unauthorized);

      case 500:
        return ServerFailure(S.current.internalServerError);

      default:
        return ServerFailure(S.current.generalError);
    }
  }
}
