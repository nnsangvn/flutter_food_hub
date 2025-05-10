import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_food_hub/core/constants/api_urls.dart';
import 'package:flutter_food_hub/core/network/dio_client.dart';
import 'package:flutter_food_hub/data/models/signin_req_params.dart';
import 'package:flutter_food_hub/data/models/signup_req_params.dart';
import 'package:flutter_food_hub/data/models/verify_code_req_params.dart';
import 'package:flutter_food_hub/service_locator.dart';

abstract class AuthApiService {
  Future<Either> signup(SignupReqParams signupReq);
  Future<Either> verifyCode(VerifyCodeReqParams verifyCodeReq);
  Future<Either> resendCode(String email);
  Future<Either> signin(SigninReqParams signinReq);
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> signup(SignupReqParams signupReq) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrls.register,
        data: signupReq.toMap(),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? e.response);
    }
  }

  @override
  Future<Either> verifyCode(VerifyCodeReqParams verifyCodeReq) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrls.verifyCode,
        data: verifyCodeReq.toMap(),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? e.response);
    }
  }

  @override
  Future<Either> resendCode(String email) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrls.resendCode,
        data: {'email': email},
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? e.response);
    }
  }

  @override
  Future<Either> signin(SigninReqParams signinReq) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrls.signin,
        data: signinReq.toMap(),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? e.response);
    }
  }
}
