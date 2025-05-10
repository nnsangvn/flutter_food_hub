import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_hub/domain/usecases/signin_usecase.dart';
import 'package:flutter_food_hub/data/models/signin_req_params.dart';
import 'package:flutter_food_hub/presentation/auth/bloc/signin_event.dart';
import 'package:flutter_food_hub/presentation/auth/bloc/signin_state.dart';
import 'package:flutter_food_hub/service_locator.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final SigninUseCase _signinUseCase;
  SigninBloc()
      : _signinUseCase = sl<SigninUseCase>(),
        super(SigninInitial()) {
    on<SigninSubmitted>(_onSigninSubmitted);
  }

  Future<void> _onSigninSubmitted(
    SigninSubmitted event,
    Emitter<SigninState> emit,
  ) async {
    emit(SigninLoading());
    try {
      final result = await _signinUseCase.call(
        param: SigninReqParams(
          username: event.email,
          password: event.password,
        ),
      );
      result.fold(
        (error) => emit(SigninFailure(message: error.toString())),
        (data) => emit(SigninSuccess(data: data)),
      );
    } catch (e) {
      emit(SigninFailure(message: e.toString()));
    }
  }
}
