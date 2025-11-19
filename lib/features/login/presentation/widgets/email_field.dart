import 'package:easacc_flutter_task/features/login/presentation/manager/login_cubit.dart';
import 'package:easacc_flutter_task/features/login/presentation/manager/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easacc_flutter_task/core/components/custom_text_form_filed.dart';
import 'package:easacc_flutter_task/core/styles/app_colors.dart';
import 'package:easacc_flutter_task/core/utils/helper/spacing.dart';
import 'package:easacc_flutter_task/core/utils/validator.dart';
import 'package:easacc_flutter_task/generated/assets.dart';
import 'package:easacc_flutter_task/generated/l10n.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.emailLabel,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.neutral600,
          ),
        ),
        verticalSpace(8),
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (previous, current) => current is LoginAutoValidate,
          builder: (context, state) {
            final loginCubit = context.read<LoginCubit>();
            return CustomTextFormField(
              isAutoValidate: loginCubit.isAutoValidate,
              unFocusOnTapOutside: true,
              textInputAction: TextInputAction.next,
              prefixIcon: SvgPicture.asset(
                Assets.assetsImagesSvgsMail01,
                width: 16.r,
                height: 16.r,
              ),
              controller: loginCubit.emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                return Validator.validateEmail(value!.trim());
              },
              hintText: S.current.emailHint,
            );
          },
        ),
      ],
    );
  }
}
