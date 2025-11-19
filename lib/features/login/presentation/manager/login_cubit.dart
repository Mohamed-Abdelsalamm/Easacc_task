import 'package:easacc_flutter_task/features/login/data/models/login_request_body_model.dart';
import 'package:easacc_flutter_task/features/login/data/repo/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easacc_flutter_task/core/prefs/app_preferences.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginInitial());

  final LoginRepo _loginRepo;
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isAutoValidate = false;
  bool get isAutoValidate => _isAutoValidate;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  Future<void> login() async {
    enableAutoValidate();

    if (!formKey.currentState!.validate()) return;

    emit(LoginLoading());

    final result = await _loginRepo.login(
      requestBody: LoginRequestBodyModel(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ),
    );

    result.fold((failure) => emit(LoginFailure(failure.message)), (
      loginResponse,
    ) async {
      await AppPreference.setUserToken(loginResponse.token);
      await AppPreference.setUserName(loginResponse.user?.name);
      await AppPreference.setUserEmail(loginResponse.user?.email);
      emit(LoginSuccess(loginResponse));
    });
  }

  void enableAutoValidate() {
    if (!_isAutoValidate) {
      _isAutoValidate = true;
      emit(LoginAutoValidate());
    }
  }

  void reset() {
    _emailController.clear();
    _passwordController.clear();
    _isAutoValidate = false;
    emit(LoginInitial());
  }

  @override
  Future<void> close() {
    _emailController.dispose();
    _passwordController.dispose();
    return super.close();
  }
}
