class VerifyCodeReqParams {
  final String email;
  final String code;

  VerifyCodeReqParams({
    required this.email,
    required this.code,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'code': code,
    };
  }
}
