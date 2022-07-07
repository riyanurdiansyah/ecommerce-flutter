import 'package:ecommerce_flutter/data/entity/auth_user_entity.dart';
import 'package:equatable/equatable.dart';

// enum AuthStatus { initial, success, error, loading }

// extension AuthStatusX on AuthStatus {
//   bool get isInitial => this == AuthStatus.initial;
//   bool get isSuccess => this == AuthStatus.success;
//   bool get isError => this == AuthStatus.error;
//   bool get isLoading => this == AuthStatus.loading;
// }

class AuthState extends Equatable {
  final int idSelected;
  final bool isLoading;
  final String? email;
  final String? password;
  final bool isObsecure;

  const AuthState({
    this.idSelected = 0,
    this.isLoading = false,
    this.email,
    this.password,
    this.isObsecure = true,
  });

  @override
  List<Object> get props => [];

  AuthState copyWith({
    int? idSelected,
    bool? isLoading,
    String? email,
    String? password,
    bool? isObsecure,
  }) {
    return AuthState(
      idSelected: idSelected ?? this.idSelected,
      isLoading: isLoading ?? this.isLoading,
      email: email ?? this.email,
      password: password ?? this.password,
      isObsecure: isObsecure ?? this.isObsecure,
    );
  }
}

class InitialAuthState extends AuthState {}

class EmailValidState extends AuthState {}

class PasswordValidState extends AuthState {}

class IsObsecurePasswordState extends AuthState {}

class IsNotObsecurePasswordState extends AuthState {}

class LoadingAuthState extends AuthState {
  final bool isLoadingAuth;

  const LoadingAuthState({required this.isLoadingAuth});
}

class ErrorEmailState extends AuthState {
  final String? errorEmail;

  const ErrorEmailState({this.errorEmail});

  @override
  List<Object> get props => [errorEmail ?? ''];
}

class ErrorPasswordState extends AuthState {
  final String? errorPassword;

  const ErrorPasswordState({this.errorPassword});

  @override
  List<Object> get props => [errorPassword ?? ''];
}

class ObsecurePasswordState extends AuthState {
  @override
  final bool isObsecure;

  const ObsecurePasswordState({required this.isObsecure});
}

class ErrorAuthState extends AuthState {
  final String? errorMessage;

  const ErrorAuthState({this.errorMessage});

  @override
  List<Object> get props => [errorMessage ?? ''];

  @override
  String toString() => 'LOGIN FAILURE --> message: $errorMessage';
}

class AuthNoData extends AuthState {
  final String? nodataMessage;

  const AuthNoData({this.nodataMessage});
  @override
  List<Object> get props => [nodataMessage ?? ''];

  @override
  String toString() => 'LOGIN NO DATA --> message: $nodataMessage';
}

class AuthHasData extends AuthState {
  final AuthUserEntity? dataUser;

  const AuthHasData({this.dataUser});

  @override
  List<Object> get props => [dataUser ?? AuthUserEntity()];
}
