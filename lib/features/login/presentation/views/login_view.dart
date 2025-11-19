import 'package:easacc_flutter_task/core/utils/helper/spacing.dart';
import 'package:easacc_flutter_task/features/login/presentation/widgets/forgot_password_link.dart';
import 'package:easacc_flutter_task/features/login/presentation/widgets/header.dart';
import 'package:easacc_flutter_task/features/login/presentation/widgets/login_app_bar.dart';
import 'package:easacc_flutter_task/features/login/presentation/widgets/login_button.dart';
import 'package:easacc_flutter_task/features/login/presentation/widgets/login_form.dart';
import 'package:easacc_flutter_task/features/login/presentation/widgets/sign_up_prompt.dart';
import 'package:easacc_flutter_task/features/login/presentation/widgets/social_media_login_widget.dart';
import 'package:easacc_flutter_task/features/login/presentation/widgets/terms_and_privacy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: LoginAppBar(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Header(),
                        verticalSpace(24),
                        const LoginForm(),
                        verticalSpace(12),
                        const ForgotPasswordLink(),
                        verticalSpace(24),
                        const SocialMediaLoginWidget(),
                        const Spacer(),
                        const SignUpPrompt(),
                        verticalSpace(24),
                        const LoginButton(),
                        verticalSpace(24),
                        const TermsAndPrivacy(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
