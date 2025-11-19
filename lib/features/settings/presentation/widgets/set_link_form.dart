import 'package:easacc_flutter_task/core/components/custom_button.dart';
import 'package:easacc_flutter_task/core/components/custom_text_form_filed.dart';
import 'package:easacc_flutter_task/core/prefs/app_preferences.dart';
import 'package:easacc_flutter_task/core/routing/app_routes.dart';
import 'package:easacc_flutter_task/core/utils/extensions/snack_bar_extension.dart';
import 'package:easacc_flutter_task/core/utils/helper/spacing.dart';
import 'package:easacc_flutter_task/core/utils/validator.dart';
import 'package:easacc_flutter_task/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../manager/set_link_cubit.dart';
import '../manager/set_link_state.dart';

class SetLinkForm extends StatefulWidget {
  const SetLinkForm({super.key});

  @override
  State<SetLinkForm> createState() => _SetLinkFormState();
}

class _SetLinkFormState extends State<SetLinkForm> {
  @override
  void initState() {
    super.initState();
    context.read<SetLinkCubit>().linkController.text =
        AppPreference.getHomeLink() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SetLinkCubit>();

    return BlocConsumer<SetLinkCubit, SetLinkState>(
      listener: (context, state) {
        if (state is SetLinkSaved) {
          context.go(AppRoutes.kHomeView);
        }
        if (state is SetLinkFailure) {
          context.showCustomSnackBar(state.errorMessage);
        }
      },
      builder: (context, state) {
        final isSaving = state is SetLinkLoading;
        return  Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: cubit.formKey,
              autovalidateMode: cubit.isAutoValidate
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(S.of(context).enterLinkPrompt),
                  verticalSpace(12),
                  CustomTextFormField(
                    controller: cubit.linkController,
                    keyboardType: TextInputType.url,
                    hintText: 'https://example.com',
                    validator: (value) {
                      return Validator.validateLink(value);
                    },
                  ),
                  verticalSpace(12),
                  CustomButton(
                    title: S.of(context).save,
                    onPressed: cubit.saveLink,
                    isLoading: isSaving,
                  ),
                ],
              ),
            ),
          );
      },
    );
  }
}
