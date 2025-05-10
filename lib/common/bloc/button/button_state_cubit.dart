import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_hub/common/bloc/button/button_state.dart';
import 'package:flutter_food_hub/core/usecase/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  void excute({dynamic params, required UseCase usecase}) async {
    emit(ButtonLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    try {
      Either result = await usecase.call(param: params);

      result.fold((error) {
        var message = error;
        if (message is List) {
          message = message.join(', ');
        } else if (message is Map && message['message'] != null) {
          message = message['message'];
          if (message is List) message = message.join(', ');
        }
        emit(ButtonFailureState(errorMessage: message.toString()));
      }, (data) {
        emit(ButtonSuccessState());
      });
    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}
