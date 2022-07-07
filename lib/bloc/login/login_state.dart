import 'package:ecommerce_flutter/data/entity/auth_user_entity.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.errorEmail = '',
    this.errorPassword = '',
    this.isObsecure = true,
  });

  final String email;
  final String password;
  final String errorEmail;
  final String errorPassword;
  final bool isObsecure;

  @override
  List<Object?> get props =>
      [email, password, errorEmail, errorPassword, isObsecure];
}

class InitialLoginState extends LoginState {
  const InitialLoginState() : super();
}

class ChangeEmailForm extends LoginState {
  const ChangeEmailForm(String val) : super(email: val);
}

class ValidInputLoginState extends LoginState {}

class EmailValidState extends LoginState {}

class PasswordValidState extends LoginState {}

class ErrorInputState extends LoginState {
  const ErrorInputState(
      String valError, String valErrorPass, String valEmail, String valPassword)
      : super(
          errorEmail: valError,
          errorPassword: valErrorPass,
          email: valEmail,
          password: valPassword,
        );
}

class ChangeInputState extends LoginState {
  const ChangeInputState(
    String valEmail,
    String valPass,
    String emailError,
    String passError,
    bool valObsecure,
  ) : super(
          email: valEmail,
          password: valPass,
          errorEmail: emailError,
          errorPassword: passError,
          isObsecure: valObsecure,
        );
}

class LoginNoData extends LoginState {
  final String? nodataMessage;

  const LoginNoData({this.nodataMessage});
  @override
  List<Object> get props => [nodataMessage ?? ''];

  @override
  String toString() => 'LOGIN NO DATA --> message: $nodataMessage';
}

class LoginHasData extends LoginState {
  final AuthUserEntity? dataUser;

  const LoginHasData({this.dataUser});

  @override
  List<Object> get props => [dataUser ?? AuthUserEntity()];
}

class ErrorLoginState extends LoginState {
  final String? errorMessage;

  const ErrorLoginState({this.errorMessage});

  @override
  List<Object> get props => [errorMessage ?? ''];

  @override
  String toString() => 'LOGIN FAILURE --> message: $errorMessage';
}

class IsObsecurePasswordState extends LoginState {}

class IsNotObsecurePasswordState extends LoginState {}
