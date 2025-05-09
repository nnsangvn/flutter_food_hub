abstract class VerifyCodeState {}

class VerifyCodeInitial extends VerifyCodeState {}

class VerifyCodeLoading extends VerifyCodeState {}

class VerifyCodeSuccess extends VerifyCodeState {
  final dynamic data;
  VerifyCodeSuccess({this.data});
}

class VerifyCodeError extends VerifyCodeState {
  final String message;
  VerifyCodeError({required this.message});
}

class ResendCodeLoading extends VerifyCodeState {}

class ResendCodeSuccess extends VerifyCodeState {}

class ResendCodeError extends VerifyCodeState {
  final String message;
  ResendCodeError({required this.message});
}
