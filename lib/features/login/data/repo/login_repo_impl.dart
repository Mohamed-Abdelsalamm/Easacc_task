import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easacc_flutter_task/core/error/failure.dart';
import 'package:easacc_flutter_task/core/network/api_constants.dart';
import 'package:easacc_flutter_task/core/network/api_service.dart';
import 'package:easacc_flutter_task/features/login/data/models/login_request_body_model.dart';
import 'package:easacc_flutter_task/features/login/data/models/login_response_model.dart';
import 'package:easacc_flutter_task/features/login/data/repo/login_repo.dart';


class LoginRepoImpl implements LoginRepo {
  final ApiService _apiService;

  LoginRepoImpl(this._apiService);

  @override
  Future<Either<Failure, LoginResponseModel>> login({
    required LoginRequestBodyModel requestBody,
  }) async {
    try {
      final user = await _apiService.post(
        data: requestBody.toJson(),
        endPoint: ApiConstants.loginEndPoint,
      );
      return Right(LoginResponseModel.fromJson(user));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
