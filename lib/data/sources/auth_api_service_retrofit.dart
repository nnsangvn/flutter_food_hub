import 'package:flutter_food_hub/core/constants/api_urls.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_food_hub/data/models/signup_req_params.dart';
import 'package:flutter_food_hub/data/models/verify_code_req_params.dart';
import 'package:flutter_food_hub/data/models/signin_req_params.dart';

part 'auth_api_service_retrofit.g.dart';

@RestApi()
abstract class AuthApiServiceRetrofit {
  factory AuthApiServiceRetrofit(
    Dio dio,
  ) = _AuthApiServiceRetrofit;

  @POST(ApiUrls.register)
  Future<dynamic> signup(@Body() SignupReqParams signupReq);

  @POST(ApiUrls.verifyCode)
  Future<dynamic> verifyCode(@Body() VerifyCodeReqParams verifyCodeReq);

  @POST(ApiUrls.resendCode)
  Future<dynamic> resendCode(@Body() Map<String, dynamic> email);

  @POST(ApiUrls.signin)
  Future<dynamic> signin(@Body() SigninReqParams signinReq);
}
