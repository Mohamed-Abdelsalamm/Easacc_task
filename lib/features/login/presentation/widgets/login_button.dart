import 'package:easacc_flutter_task/core/components/custom_button.dart';
import 'package:easacc_flutter_task/core/routing/app_routes.dart';
import 'package:easacc_flutter_task/core/utils/extensions/snack_bar_extension.dart';
import 'package:easacc_flutter_task/features/login/presentation/manager/login_cubit.dart';
import 'package:easacc_flutter_task/features/login/presentation/manager/login_state.dart';
import 'package:easacc_flutter_task/generated/assets.dart';
import 'package:easacc_flutter_task/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.showCustomSnackBar(
            state.loginResponse.message == "User successfully logged in"
                ? S.current.loginSuccess
                : S.current.loginFailed,
          );
        } else if (state is LoginFailure) {
          context.showCustomSnackBar(
            state.errorMessage == "Invalid email or password"
                ? S.current.invalidEmailOrPassword
                : S.current.loginFailed,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          title: S.current.loginTitle,
          isLoading: state is LoginLoading,
          svgImage: Assets.assetsImagesSvgsArrowLeft02,
          onPressed: () {
            context.go(AppRoutes.kHomeView);
          },
        );
      },
    );
  }
}
