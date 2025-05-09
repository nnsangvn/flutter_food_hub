import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_hub/data/models/verify_code_req_params.dart';
import 'package:flutter_food_hub/domain/usecases/resend_code_usecase.dart';
import 'package:flutter_food_hub/domain/usecases/verify_code_usecase.dart';
import 'package:flutter_food_hub/presentation/auth/bloc/verify_code_event.dart';
import 'package:flutter_food_hub/presentation/auth/bloc/verify_code_state.dart';
import 'package:flutter_food_hub/service_locator.dart';

class VerifyCodeBloc extends Bloc<VerifyCodeEvent, VerifyCodeState> {
  final VerifyCodeUseCase _verifyCodeUseCase;
  final ResendCodeUseCase _resendCodeUseCase;

  VerifyCodeBloc()
      : _verifyCodeUseCase = sl<VerifyCodeUseCase>(),
        _resendCodeUseCase = sl<ResendCodeUseCase>(),
        super(VerifyCodeInitial()) {
    on<VerifyCode>(_onVerifyCode);
    on<ResendCode>(_onResendCode);
  }

  Future<void> _onVerifyCode(
    VerifyCode event,
    Emitter<VerifyCodeState> emit,
  ) async {
    emit(VerifyCodeLoading());
    try {
      final result = await _verifyCodeUseCase.call(
        param: VerifyCodeReqParams(
          email: event.email,
          code: event.code,
        ),
      );

      result.fold(
        (error) => emit(VerifyCodeError(message: error.toString())),
        (data) => emit(VerifyCodeSuccess(data: data)),
      );
    } catch (e) {
      emit(VerifyCodeError(message: e.toString()));
    }
  }

  Future<void> _onResendCode(
    ResendCode event,
    Emitter<VerifyCodeState> emit,
  ) async {
    emit(ResendCodeLoading());
    try {
      final result = await _resendCodeUseCase.call(param: event.email);

      result.fold(
        (error) => emit(ResendCodeError(message: error.toString())),
        (data) => emit(ResendCodeSuccess()),
      );
    } catch (e) {
      emit(ResendCodeError(message: e.toString()));
    }
  }
}
