import 'package:json_annotation/json_annotation.dart';
part 'verify_code_req_params.g.dart';

@JsonSerializable()
class VerifyCodeReqParams {
  final String email;
  final String code;

  VerifyCodeReqParams({
    required this.email,
    required this.code,
  });

  factory VerifyCodeReqParams.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeReqParamsFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyCodeReqParamsToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'code': code,
    };
  }
}
