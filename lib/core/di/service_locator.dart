import 'package:dio/dio.dart';
import 'package:easacc_flutter_task/core/di/navigator_service.dart';
import 'package:easacc_flutter_task/core/network/api_service.dart';
import 'package:easacc_flutter_task/features/login/data/repo/login_repo.dart';
import 'package:easacc_flutter_task/features/login/data/repo/login_repo_impl.dart';
import 'package:easacc_flutter_task/features/login/presentation/manager/login_cubit.dart';
import 'package:easacc_flutter_task/features/set_link/presentation/manager/set_link_cubit.dart';
import 'package:easacc_flutter_task/features/home/presentation/manager/home_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio()
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            compact: false,
          ),
        ),
    ),
  );

  getIt.registerSingleton<NavigationService>(NavigationService());

  getIt.registerSingleton<LoginRepo>(LoginRepoImpl(getIt.get<ApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt.get<LoginRepo>()));
  getIt.registerFactory<SetLinkCubit>(() => SetLinkCubit());
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
}
