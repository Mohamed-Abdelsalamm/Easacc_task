import 'package:easacc_flutter_task/core/components/customa_app_bar.dart';
import 'package:easacc_flutter_task/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easacc_flutter_task/core/di/service_locator.dart';
import 'package:easacc_flutter_task/features/settings/presentation/manager/set_link_cubit.dart';
import 'package:easacc_flutter_task/features/settings/presentation/widgets/set_link_form.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SetLinkCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: S.of(context).settings,
          haveArrowBack: false,
        ),
        body: const SetLinkForm(),
      ),
    );
  }
}
