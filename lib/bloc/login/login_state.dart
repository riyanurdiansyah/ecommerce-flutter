import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.errorEmail = '',
    this.errorPassword = '',
  });

  final String email;
  final String password;
  final String errorEmail;
  final String errorPassword;

  @override
  List<Object?> get props => [email, password, errorEmail, errorPassword];
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
  ) : super(
          email: valEmail,
          password: valPass,
          errorEmail: emailError,
          errorPassword: passError,
        );
}
