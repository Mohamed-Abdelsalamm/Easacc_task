import 'package:flutter/material.dart';
import 'package:easacc_flutter_task/core/styles/app_colors.dart';
import 'package:easacc_flutter_task/generated/l10n.dart';

class TermsAndPrivacy extends StatelessWidget {
  const TermsAndPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: S.current.termsAgreementPart1,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.neutral600,
                letterSpacing: 0,
              ),
            ),
            const TextSpan(text: ' '),
            WidgetSpan(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  S.current.privacyPolicy,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.primary400,
                    decorationColor: AppColors.primary400,
                    decoration: TextDecoration.underline,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
            TextSpan(
              text: ' و ',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.neutral600,
                letterSpacing: 0,
              ),
            ),
            WidgetSpan(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  S.current.termsOfUse,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.primary400,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary400,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),

            const TextSpan(text: ' '),
            TextSpan(
              text: S.current.termsAgreementPart3,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.neutral600,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
