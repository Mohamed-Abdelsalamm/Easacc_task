import 'package:easacc_flutter_task/core/styles/app_colors.dart';
import 'package:easacc_flutter_task/generated/l10n.dart';
import 'package:flutter/material.dart';

class SignUpPrompt extends StatelessWidget {
  const SignUpPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: S.current.noAccountPrompt,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.neutral500),
            ),
            const TextSpan(text: ' '),
            WidgetSpan(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  S.current.createAccountLink,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.primary600,
                    decorationColor: AppColors.primary600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
