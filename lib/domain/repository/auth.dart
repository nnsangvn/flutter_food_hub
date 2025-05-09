import 'package:dartz/dartz.dart';
import 'package:flutter_food_hub/data/models/signup_req_params.dart';
import 'package:flutter_food_hub/data/models/verify_code_req_params.dart';

abstract class AuthRepository {
  Future<Either> signup(SignupReqParams signupReq);
  Future<Either> verifyCode(VerifyCodeReqParams verifyCodeReq);
  Future<Either> resendCode(String email);
}
