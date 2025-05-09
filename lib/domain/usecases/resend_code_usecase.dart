import 'package:dartz/dartz.dart';
import 'package:flutter_food_hub/core/usecase/usecase.dart';
import 'package:flutter_food_hub/domain/repository/auth.dart';
import 'package:flutter_food_hub/service_locator.dart';

class ResendCodeUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? param}) async {
    return sl<AuthRepository>().resendCode(param!);
  }
}
