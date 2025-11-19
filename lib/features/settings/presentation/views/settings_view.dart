import 'package:easacc_flutter_task/core/components/customa_app_bar.dart';
import 'package:easacc_flutter_task/core/cubits/language_cubit.dart';
import 'package:easacc_flutter_task/core/utils/helper/spacing.dart';
import 'package:easacc_flutter_task/generated/assets.dart';
import 'package:easacc_flutter_task/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easacc_flutter_task/core/di/service_locator.dart';
import 'package:easacc_flutter_task/features/settings/presentation/manager/set_link_cubit.dart';
import 'package:easacc_flutter_task/features/settings/presentation/manager/devices_cubit.dart';
import 'package:easacc_flutter_task/features/settings/presentation/widgets/set_link_form.dart';
import 'package:easacc_flutter_task/features/settings/presentation/widgets/devices_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<SetLinkCubit>()),
        BlocProvider(create: (_) => getIt<DevicesCubit>()),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: S.of(context).settings,
          haveArrowBack: false,
          actions: [
            IconButton(
              onPressed: () {
                context.read<LanguageCubit>().toggleLanguage(
                  context.read<LanguageCubit>().state.selectedLanguage == "en"
                      ? 'ar'
                      : 'en',
                );
              },
              icon: SvgPicture.asset(
                Assets.assetsImagesSvgsEarth,
                width: 24.r,
                height: 24.r,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SetLinkForm(),
              const DevicesSection(),
              verticalSpace(60),
            ],
          ),
        ),
      ),
    );
  }
}
