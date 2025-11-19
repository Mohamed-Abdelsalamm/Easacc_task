import 'package:dartz/dartz.dart';
import 'package:easacc_flutter_task/core/error/failure.dart';
import 'package:easacc_flutter_task/features/login/data/models/login_request_body_model.dart';
import 'package:easacc_flutter_task/features/login/data/models/login_response_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;


abstract class LoginRepo {
  Future<Either<Failure, LoginResponseModel>> login({
    required LoginRequestBodyModel requestBody,
  });

  Future<Either<Failure, firebase_auth.User>> signInWithGoogle();

  Future<Either<Failure, firebase_auth.User>> signInWithFacebook();
}
