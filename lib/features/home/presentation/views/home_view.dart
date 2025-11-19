import 'package:easacc_flutter_task/core/components/custom_button.dart';
import 'package:easacc_flutter_task/core/components/customa_app_bar.dart';
import 'package:easacc_flutter_task/core/utils/helper/spacing.dart';
import 'package:easacc_flutter_task/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:easacc_flutter_task/core/di/service_locator.dart';
import 'package:easacc_flutter_task/features/home/presentation/manager/home_cubit.dart';
import 'package:easacc_flutter_task/features/home/presentation/manager/home_state.dart';
import 'package:easacc_flutter_task/features/home/presentation/widgets/home_webview.dart';
import 'package:easacc_flutter_task/core/routing/app_routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeCubit>()..loadLink(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();

          return Scaffold(
            appBar: CustomAppBar(
              title: S.of(context).home,
              haveArrowBack: false,
              actions: state is HomeLoaded
                  ? [
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () => cubit.refresh(),
                      ),
                      IconButton(
                        icon: const Icon(Icons.link),
                        onPressed: () => context.go(AppRoutes.kSettingsView),
                      ),
                    ]
                  : null,
            ),
            body: () {
              if (state is HomeLoading || state is HomeInitial) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is HomeNoLink) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0.w,
                      vertical: 8.0.h,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(S.of(context).noLinkConfigured),
                        verticalSpace(12),
                        CustomButton(
                          onPressed: () => context.go(AppRoutes.kSettingsView),
                          title: S.of(context).setLink,
                        ),
                      ],
                    ),
                  ),
                );
              }
              if (state is HomeError) {
                return Center(child: Text(state.message));
              }
              if (state is HomeLoaded) {
                return Stack(
                  children: [
                    HomeWebView(link: state.link),
                    if (state.isPageLoading) const LinearProgressIndicator(),
                  ],
                );
              }

              return const SizedBox.shrink();
            }(),
          );
        },
      ),
    );
  }
}
