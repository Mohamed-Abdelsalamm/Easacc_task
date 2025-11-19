import 'package:easacc_flutter_task/core/utils/helper/spacing.dart';
import 'package:easacc_flutter_task/features/login/presentation/manager/login_cubit.dart';
import 'package:easacc_flutter_task/features/login/presentation/widgets/email_field.dart';
import 'package:easacc_flutter_task/features/login/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          EmailField(),
          verticalSpace(16),
          PasswordField(),
        ],
      ),
    );
  }
}
