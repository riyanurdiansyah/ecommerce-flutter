import 'package:ecommerce_flutter/bloc/auth/auth_event.dart';
import 'package:ecommerce_flutter/bloc/auth/auth_state.dart';
import 'package:ecommerce_flutter/data/auth/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final authRepository = AuthRepository();

  final emailTC = TextEditingController();

  AuthBloc() : super(InitialAuthState()) {
    on<SelectLoginBy>(_changeSelectedLogin);
    on<LoginByEmail>(_loginByEmail);
    on<LoginByPhone>(_loginByPhone);
    on<ChangeLoading>(_changeLoading);
    on<ChangeEmail>(_changeEmail);
    on<ChangePassword>(_changePassword);
    on<ChangeObsecurePassword>(_changeObsecurePassword);
  }

  @override
  Future<void> close() {
    print("ON CLOSE");
    return super.close();
  }

  void dispose() {
    print("DISPOSE");
    emailTC.dispose();
  }

  void _changeSelectedLogin(
      SelectLoginBy event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
        idSelected: event.idSelected,
      ),
    );
  }

  void _changeLoading(ChangeLoading event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(isLoading: event.isLoading),
    );
  }

  void _changeObsecurePassword(
      ChangeObsecurePassword event, Emitter<AuthState> emit) async {
    if (event.isObsecure) {
      emit(IsObsecurePasswordState());
    } else {
      emit(IsNotObsecurePasswordState());
    }
  }

  void _changeEmail(ChangeEmail event, Emitter<AuthState> emit) async {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);
    if (event.email.isEmpty) {
      emit(const ErrorEmailState(errorEmail: 'Email tidak boleh kosong'));
    } else if (!regExp.hasMatch(event.email.trim())) {
      emit(const ErrorEmailState(errorEmail: 'Format email tidak valid'));
    } else {
      emit(
        state.copyWith(email: event.email),
      );
      emit(EmailValidState());
    }
  }

  void _changePassword(ChangePassword event, Emitter<AuthState> emit) async {
    if (event.password.isEmpty) {
      emit(const ErrorPasswordState(
          errorPassword: 'Password tidak boleh kosong'));
    } else if (event.password.length < 8) {
      emit(const ErrorPasswordState(
          errorPassword: 'Password minimal 8 karakter'));
    } else {
      emit(
        state.copyWith(password: event.password),
      );
      emit(PasswordValidState());
    }
  }

  void _loginByEmail(LoginByEmail event, Emitter<AuthState> emit) async {
    try {
      final response =
          await authRepository.loginByEmail(event.email, event.password);
      if (response != null) {
        if (response.status == 200) {
          AuthHasData(dataUser: response);
        } else {
          AuthNoData(nodataMessage: response.message);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("ERROR LOGIN BY EMAIL : ${e.toString()}");
      }
      ErrorAuthState(errorMessage: e.toString());
    }
  }

  void _loginByPhone(LoginByPhone event, Emitter<AuthState> emit) async {}
}
