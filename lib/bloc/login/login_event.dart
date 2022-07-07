import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class ChangeInputLogin extends LoginEvent {
  final String email;
  final String password;

  const ChangeInputLogin({
    required this.email,
    required this.password,
  });
}

class ChangeEmail extends LoginEvent {
  final String email;
  const ChangeEmail({
    required this.email,
  });
}

class ChangePassword extends LoginEvent {
  final String password;
  const ChangePassword({
    required this.password,
  });
}
