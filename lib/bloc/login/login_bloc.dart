import 'package:ecommerce_flutter/bloc/login/login_event.dart';
import 'package:ecommerce_flutter/bloc/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const InitialLoginState()) {
    on<ChangeEmail>(_changeEmail);
    on<ChangePassword>(_changePassword);
  }

  void _changeEmail(ChangeEmail event, Emitter<LoginState> emit) async {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);
    if (event.email.isEmpty) {
      emit(ErrorInputState('Email tidak boleh kosong', state.errorPassword,
          state.email, state.password));
    } else if (!regExp.hasMatch(event.email.trim())) {
      emit(ErrorInputState('Format email tidak valid', state.errorPassword,
          state.email, state.password));
    } else {
      emit(ChangeInputState(
          event.email, state.password, '', state.errorPassword));
    }
  }

  void _changePassword(ChangePassword event, Emitter<LoginState> emit) async {
    if (event.password.isEmpty) {
      emit(ErrorInputState(state.errorEmail, 'Password tidak boleh kosong',
          state.email, state.password));
    } else if (event.password.length < 8) {
      emit(ErrorInputState(state.errorEmail, 'Password minimal 8 karakter',
          state.email, state.password));
    } else {
      emit(ChangeInputState(state.email, event.password, state.errorEmail, ''));
    }
  }
}
