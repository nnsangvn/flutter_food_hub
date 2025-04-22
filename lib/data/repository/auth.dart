import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_food_hub/data/models/signup_req_params.dart';
import 'package:flutter_food_hub/data/sources/auth_api_service.dart';
import 'package:flutter_food_hub/domain/repository/auth.dart';
import 'package:flutter_food_hub/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(SignupReqParams signupReq) async {
    Either result = await sl<AuthApiService>().signup(signupReq);
    return result.fold((error) {
      return Left(error);
    }, (data) async {
      Response response = data;
      return Right(response);
    });
  }
}
