abstract class SigninState {}

class SigninInitial extends SigninState {}

class SigninLoading extends SigninState {}

class SigninSuccess extends SigninState {
  final dynamic data;
  SigninSuccess({this.data});
}

class SigninFailure extends SigninState {
  final String message;
  SigninFailure({required this.message});
}
