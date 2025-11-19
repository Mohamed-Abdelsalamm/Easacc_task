import 'package:dartz/dartz.dart';
import 'package:easacc_flutter_task/core/error/failure.dart';
import 'package:easacc_flutter_task/features/login/data/models/login_request_body_model.dart';
import 'package:easacc_flutter_task/features/login/data/models/login_response_model.dart';


abstract class LoginRepo {
  Future<Either<Failure, LoginResponseModel>> login({
    required LoginRequestBodyModel requestBody,
  });
}
