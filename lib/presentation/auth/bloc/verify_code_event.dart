abstract class VerifyCodeEvent {}

class VerifyCode extends VerifyCodeEvent {
  final String email;
  final String code;

  VerifyCode({required this.email, required this.code});
}

class ResendCode extends VerifyCodeEvent {
  final String email;

  ResendCode({required this.email});
}
