import 'package:flutter_food_hub/core/network/dio_client.dart';
import 'package:flutter_food_hub/data/repository/auth.dart';
import 'package:flutter_food_hub/data/sources/auth_api_service.dart';
import 'package:flutter_food_hub/domain/repository/auth.dart';
import 'package:flutter_food_hub/domain/usecases/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
}
