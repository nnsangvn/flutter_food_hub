import 'package:dartz/dartz.dart';

import '../../core/usecase/usecase.dart';
import 'package:flutter_food_hub/data/models/signin_req_params.dart';
import 'package:flutter_food_hub/domain/repository/auth.dart';
import 'package:flutter_food_hub/service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninReqParams> {
  @override
  Future<Either> call({SigninReqParams? param}) async {
    return sl<AuthRepository>().signin(param!);
  }
}
