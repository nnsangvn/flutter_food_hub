import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_food_hub/data/models/signin_req_params.dart';
import 'package:flutter_food_hub/data/models/signup_req_params.dart';
import 'package:flutter_food_hub/data/models/verify_code_req_params.dart';
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
      return Right(data);
    });
  }

  @override
  Future<Either> verifyCode(VerifyCodeReqParams verifyCodeReq) async {
    Either result = await sl<AuthApiService>().verifyCode(verifyCodeReq);
    return result.fold((error) {
      return Left(error);
    }, (data) async {
      return Right(data);
    });
  }

  @override
  Future<Either> resendCode(String email) async {
    Either result = await sl<AuthApiService>().resendCode(email);
    return result.fold((error) {
      return Left(error);
    }, (data) async {
      return Right(data);
    });
  }

  @override
  Future<Either> signin(SigninReqParams signinReq) async {
    Either result = await sl<AuthApiService>().signin(signinReq);
    return result.fold((error) {
      return Left(error);
    }, (data) async {
      return Right(data);
    });
  }
}
