import 'package:easacc_flutter_task/core/di/service_locator.dart';
import 'package:easacc_flutter_task/core/layout/main_layout.dart';
import 'package:easacc_flutter_task/core/routing/app_routes.dart';
import 'package:easacc_flutter_task/features/home/presentation/views/home_view.dart';
import 'package:easacc_flutter_task/features/login/presentation/manager/login_cubit.dart';
import 'package:easacc_flutter_task/features/login/presentation/views/login_view.dart';
import 'package:easacc_flutter_task/features/settings/presentation/views/settings_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static Future<GoRouter> createRouter() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final isLoggedIn = await auth.currentUser?.getIdToken() != null;

    return GoRouter(
      initialLocation: isLoggedIn ? AppRoutes.kHomeView : AppRoutes.kLoginView,
      routes: <RouteBase>[
        ShellRoute(
          builder: (context, state, child) {
            int currentIndex = 0;
            final location = state.uri.path;
            if (location == AppRoutes.kHomeView) {
              currentIndex = 0;
            } else if (location == AppRoutes.kSettingsView) {
              currentIndex = 1;
            } else if (location == AppRoutes.kHomeView) {
              currentIndex = 2;
            }
            return MainLayout(currentIndex: currentIndex, child: child);
          },
          routes: [
            GoRoute(
              path: AppRoutes.kHomeView,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  key: state.pageKey,
                  child: const HomeView(),
                );
              },
            ),
            GoRoute(
              path: AppRoutes.kSettingsView,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  key: state.pageKey,
                  child: const SettingsView(),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: AppRoutes.kLoginView,
          builder: (context, state) => BlocProvider(
            create: (_) => getIt<LoginCubit>(),
            child: LoginView(),
          ),
        ),
      ],
    );
  }
}
