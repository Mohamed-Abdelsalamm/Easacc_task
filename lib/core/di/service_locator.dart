import 'package:dio/dio.dart';
import 'package:easacc_flutter_task/core/di/navigator_service.dart';
import 'package:easacc_flutter_task/core/network/api_service.dart';
import 'package:easacc_flutter_task/features/login/data/repo/login_repo.dart';
import 'package:easacc_flutter_task/features/login/data/repo/login_repo_impl.dart';
import 'package:easacc_flutter_task/features/login/presentation/manager/login_cubit.dart';
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
  // getIt.registerSingleton<BookingsRepo>(BookingsRepoImpl(getIt.get<ApiService>()));
  // getIt.registerSingleton<PersonalDataRepo>(
  //   PersonalDataRepoImpl(getIt.get<ApiService>()),
  // );
  // getIt.registerSingleton<ChangePasswordRepo>(
  //   ChangePasswordRepoImpl(getIt.get<ApiService>()),
  // );
  // getIt.registerSingleton<RegisterUserRepo>(
  //   RegisterUserRepoImpl(getIt.get<ApiService>()),
  // );
  // getIt.registerSingleton<ForgetPasswordRepo>(
  //   ForgetPasswordRepoImpl(getIt.get<ApiService>()),
  // );
  // getIt.registerSingleton<BlogsRepo>(BlogsRepoImpl(getIt.get<ApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt.get<LoginRepo>()));
  // getIt.registerFactory<ForgetPasswordCubit>(
  //   () => ForgetPasswordCubit(getIt.get<ForgetPasswordRepo>()),
  // );
  // getIt.registerFactory<VerifyOtpCubit>(
  //   () => VerifyOtpCubit(getIt.get<ForgetPasswordRepo>()),
  // );
  // getIt.registerFactory<ResendOtpCubit>(
  //   () => ResendOtpCubit(getIt.get<ForgetPasswordRepo>()),
  // );
  // getIt.registerFactory<CreateNewPasswordCubit>(
  //   () => CreateNewPasswordCubit(getIt.get<ForgetPasswordRepo>()),
  // );
  // getIt.registerFactory<RegisterUserCubit>(
  //   () => RegisterUserCubit(getIt.get<RegisterUserRepo>()),
  // );
  // getIt.registerFactory<SelectCountryCubit>(() => SelectCountryCubit());
  // getIt.registerFactory<BlogFetchingByIdCubit>(
  //   () => BlogFetchingByIdCubit(getIt.get<BlogsRepo>()),
  // );
  // getIt.registerLazySingleton<BlogFetchingCategoriesCubit>(
  //   () => BlogFetchingCategoriesCubit(getIt.get<BlogsRepo>()),
  // );
  // getIt.registerFactory<BlogsFetchingCubit>(
  //   () => BlogsFetchingCubit(getIt.get<BlogsRepo>()),
  // );
  // getIt.registerFactory<PersonalDataUpdateCubit>(
  //   () => PersonalDataUpdateCubit(getIt.get<PersonalDataRepo>()),
  // );
  // getIt.registerLazySingleton<PersonalDataFetchingCubit>(
  //   () => PersonalDataFetchingCubit(getIt.get<PersonalDataRepo>()),
  // );
  // getIt.registerFactory<ChangePasswordCubit>(
  //   () => ChangePasswordCubit(getIt.get<ChangePasswordRepo>()),
  // );
  // getIt.registerFactory<BookingsFetchingCubit>(
  //   () => BookingsFetchingCubit(getIt.get<BookingsRepo>()),
  // );
}
