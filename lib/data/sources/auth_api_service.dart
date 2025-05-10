import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_food_hub/core/constants/api_urls.dart';
import 'package:flutter_food_hub/core/network/dio_client.dart';
import 'package:flutter_food_hub/data/models/signin_req_params.dart';
import 'package:flutter_food_hub/data/models/signup_req_params.dart';
import 'package:flutter_food_hub/data/models/verify_code_req_params.dart';
import 'package:flutter_food_hub/service_locator.dart';
import 'package:flutter_food_hub/data/sources/auth_api_service_retrofit.dart';

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

class AuthApiServiceRetrofitImpl extends AuthApiService {
  final AuthApiServiceRetrofit retrofit;

  AuthApiServiceRetrofitImpl(this.retrofit);

  @override
  Future<Either> signup(SignupReqParams signupReq) async {
    try {
      final response = await retrofit.signup(signupReq);
      return Right(response);
    } catch (e) {
      return Left(_parseError(e));
    }
  }

  @override
  Future<Either> verifyCode(VerifyCodeReqParams verifyCodeReq) async {
    try {
      final response = await retrofit.verifyCode(verifyCodeReq);
      return Right(response);
    } catch (e) {
      return Left(_parseError(e));
    }
  }

  @override
  Future<Either> resendCode(String email) async {
    try {
      final response = await retrofit.resendCode({'email': email});
      return Right(response);
    } catch (e) {
      return Left(_parseError(e));
    }
  }

  @override
  Future<Either> signin(SigninReqParams signinReq) async {
    try {
      final response = await retrofit.signin(signinReq);
      return Right(response);
    } catch (e) {
      return Left(_parseError(e));
    }
  }

  dynamic _parseError(dynamic e) {
    if (e is DioException) {
      return e.response?.data['message'] ?? e.response;
    }
    return e.toString();
  }
}
