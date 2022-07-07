import 'package:ecommerce_flutter/bloc/login/login_event.dart';
import 'package:ecommerce_flutter/bloc/login/login_state.dart';
import 'package:ecommerce_flutter/data/auth/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final authRepository = AuthRepository();

  LoginBloc() : super(const InitialLoginState()) {
    on<ChangeEmail>(_changeEmail);
    on<ChangePassword>(_changePassword);
    on<LoginByEmail>(_loginByEmail);
    on<ChangeObsecurePassword>(_changeObsecurePassword);
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
      emit(ChangeInputState(event.email, state.password, '-',
          state.errorPassword, state.isObsecure));
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
      emit(ChangeInputState(state.email, event.password, state.errorEmail, '-',
          state.isObsecure));
    }
  }

  void _loginByEmail(LoginByEmail event, Emitter<LoginState> emit) async {
    try {
      final response =
          await authRepository.loginByEmail(event.email, event.password);
      if (response != null) {
        if (response.status == 200) {
          emit(LoginHasData(dataUser: response));
        } else {
          emit(LoginNoData(nodataMessage: response.message));
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("ERROR LOGIN BY EMAIL : ${e.toString()}");
      }
      emit(ErrorLoginState(errorMessage: e.toString()));
    }
  }

  void _changeObsecurePassword(
      ChangeObsecurePassword event, Emitter<LoginState> emit) async {
    emit(ChangeInputState(
        state.email, state.password, '', '', !state.isObsecure));
  }
}
