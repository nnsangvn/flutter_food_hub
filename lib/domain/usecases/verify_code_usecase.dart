import 'package:dartz/dartz.dart';
import 'package:flutter_food_hub/core/usecase/usecase.dart';
import 'package:flutter_food_hub/data/models/verify_code_req_params.dart';
import 'package:flutter_food_hub/domain/repository/auth.dart';
import 'package:flutter_food_hub/service_locator.dart';

class VerifyCodeUseCase implements UseCase<Either, VerifyCodeReqParams> {
  @override
  Future<Either> call({VerifyCodeReqParams? param}) async {
    return sl<AuthRepository>().verifyCode(param!);
  }
}
