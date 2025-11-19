import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easacc_flutter_task/core/di/service_locator.dart';
import 'package:easacc_flutter_task/features/set_link/presentation/manager/set_link_cubit.dart';
import 'package:easacc_flutter_task/features/set_link/presentation/widgets/set_link_form.dart';

class SetLinkView extends StatelessWidget {
  const SetLinkView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SetLinkCubit>(),
      child: const SetLinkForm(),
    );
  }
}
