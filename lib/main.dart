import 'package:easacc_flutter_task/core/cubits/language_cubit.dart';
import 'package:easacc_flutter_task/core/di/service_locator.dart';
import 'package:easacc_flutter_task/core/prefs/app_preferences.dart';
import 'package:easacc_flutter_task/core/routing/app_router.dart';
import 'package:easacc_flutter_task/core/theme/app_light_theme.dart';
import 'package:easacc_flutter_task/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference.init();
  final router = await AppRouter.createRouter();

  await ScreenUtil.ensureScreenSize();
  setupServiceLocator();

  runApp(MainApp(router: router));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => BlocProvider(
        create: (context) => LanguageCubit(),
        child: BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return MaterialApp.router(
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: Locale(state.selectedLanguage),
              theme: lightThemeData,
              routerConfig: router,
              debugShowCheckedModeBanner: false,
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child!,
              ),
            );
          },
        ),
      ),
    );
  }
}
