import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easacc_flutter_task/core/error/failure.dart';
import 'package:easacc_flutter_task/core/network/api_constants.dart';
import 'package:easacc_flutter_task/core/network/api_service.dart';
import 'package:easacc_flutter_task/features/login/data/models/login_request_body_model.dart';
import 'package:easacc_flutter_task/features/login/data/models/login_response_model.dart';
import 'package:easacc_flutter_task/features/login/data/repo/login_repo.dart';
import 'package:easacc_flutter_task/features/login/data/services/social_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;


class LoginRepoImpl implements LoginRepo {
  final ApiService _apiService;
  final SocialAuthService _socialAuthService;

  LoginRepoImpl(this._apiService, this._socialAuthService);

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

  @override
  Future<Either<Failure, firebase_auth.User>> signInWithGoogle() async {
    return await _socialAuthService.signInWithGoogle();
  }

  @override
  Future<Either<Failure, firebase_auth.User>> signInWithFacebook() async {
    return await _socialAuthService.signInWithFacebook();
  }
}
