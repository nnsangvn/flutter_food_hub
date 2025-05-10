import 'package:flutter_food_hub/core/network/dio_client.dart';
import 'package:flutter_food_hub/data/repository/auth.dart';
import 'package:flutter_food_hub/data/sources/auth_api_service.dart';
import 'package:flutter_food_hub/data/sources/auth_api_service_retrofit.dart';
import 'package:flutter_food_hub/domain/repository/auth.dart';
import 'package:flutter_food_hub/domain/usecases/resend_code_usecase.dart';
import 'package:flutter_food_hub/domain/usecases/signin_usecase.dart';
import 'package:flutter_food_hub/domain/usecases/signup.dart';
import 'package:flutter_food_hub/domain/usecases/verify_code_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter_food_hub/core/network/interceptors.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Retrofit
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.interceptors.add(LoggerInterceptor());
    return dio;
  });
  sl.registerLazySingleton<AuthApiServiceRetrofit>(
    () => AuthApiServiceRetrofit(sl<Dio>()),
  );

  // Services
  sl.registerSingleton<AuthApiService>(
    AuthApiServiceRetrofitImpl(sl<AuthApiServiceRetrofit>()),
  );

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<VerifyCodeUseCase>(VerifyCodeUseCase());
  sl.registerSingleton<ResendCodeUseCase>(ResendCodeUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}
