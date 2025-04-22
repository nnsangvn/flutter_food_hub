class SignupReqParams {
  final String fullname;
  final String email;
  final String password;

  SignupReqParams({
    required this.fullname,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': fullname,
      'email': email,
      'password': password,
    };
  }
}
