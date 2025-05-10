import 'package:json_annotation/json_annotation.dart';
part 'signup_req_params.g.dart';

@JsonSerializable()
class SignupReqParams {
  @JsonKey(name: 'name')
  final String fullname;
  final String email;
  final String password;

  SignupReqParams({
    required this.fullname,
    required this.email,
    required this.password,
  });

  factory SignupReqParams.fromJson(Map<String, dynamic> json) => _$SignupReqParamsFromJson(json);
  Map<String, dynamic> toJson() => _$SignupReqParamsToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': fullname,
      'email': email,
      'password': password,
    };
  }
}
