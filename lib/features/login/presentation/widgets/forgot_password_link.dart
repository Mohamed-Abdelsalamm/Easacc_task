import 'package:easacc_flutter_task/core/styles/app_colors.dart';
import 'package:easacc_flutter_task/generated/l10n.dart';
import 'package:flutter/material.dart';

class ForgotPasswordLink extends StatelessWidget {
  const ForgotPasswordLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {
        },
        child: Text(
          S.current.forgotPassword,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.primary600,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primary600,
          ),
        ),
      ),
    );
  }
}
