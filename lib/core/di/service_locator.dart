import 'package:dio/dio.dart';
import 'package:easacc_flutter_task/core/network/api_service.dart';
import 'package:easacc_flutter_task/features/login/data/repo/login_repo.dart';
import 'package:easacc_flutter_task/features/login/data/repo/login_repo_impl.dart';
import 'package:easacc_flutter_task/features/login/data/services/social_auth_service.dart';
import 'package:easacc_flutter_task/features/login/presentation/manager/login_cubit.dart';
import 'package:easacc_flutter_task/features/settings/data/services/bluetooth_scanner.dart';
import 'package:easacc_flutter_task/features/settings/data/services/mdns_scanner.dart';
import 'package:easacc_flutter_task/features/settings/data/services/permission_service.dart';
import 'package:easacc_flutter_task/features/settings/presentation/manager/set_link_cubit.dart';
import 'package:easacc_flutter_task/features/settings/presentation/manager/devices_cubit.dart';
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

  getIt.registerLazySingleton<SocialAuthService>(() => SocialAuthService());
  getIt.registerSingleton<LoginRepo>(
    LoginRepoImpl(
      getIt.get<ApiService>(),
      getIt.get<SocialAuthService>(),
    ),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt.get<LoginRepo>()));
  getIt.registerFactory<SetLinkCubit>(() => SetLinkCubit());
  getIt.registerLazySingleton<PermissionService>(() => PermissionService());
  getIt.registerLazySingleton<MdnsScanner>(() => MdnsScanner());
  getIt.registerLazySingleton<BluetoothScanner>(() => BluetoothScanner());
  getIt.registerFactory<DevicesCubit>(
    () => DevicesCubit(
      permissionService: getIt<PermissionService>(),
      mdnsScanner: getIt<MdnsScanner>(),
      bluetoothScanner: getIt<BluetoothScanner>(),
    ),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
}
