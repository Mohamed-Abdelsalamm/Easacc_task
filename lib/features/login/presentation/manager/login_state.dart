import 'package:easacc_flutter_task/features/login/data/models/login_response_model.dart';
import 'package:flutter/material.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginResponseModel loginResponse;

  LoginSuccess(this.loginResponse);
}

final class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}

final class LoginAutoValidate extends LoginState {
  LoginAutoValidate();
}
