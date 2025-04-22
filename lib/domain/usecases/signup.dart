import 'package:dartz/dartz.dart';
import 'package:flutter_food_hub/core/usecase/usecase.dart';
import 'package:flutter_food_hub/data/models/signup_req_params.dart';
import 'package:flutter_food_hub/domain/repository/auth.dart';
import 'package:flutter_food_hub/service_locator.dart';

class SignupUseCase implements UseCase<Either, SignupReqParams> {
  @override
  Future<Either> call({SignupReqParams? param}) async {
    return sl<AuthRepository>().signup(param!);
  }
}
