import 'package:ecommerce_flutter/data/entity/auth_user_entity.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  final AuthUserEntity? authUserEntity;

  const AuthEvent({this.authUserEntity});

  @override
  List<Object> get props => [];
}

class LoginViaEmail extends AuthEvent {
  final String email;
  final String password;
  const LoginViaEmail({
    required this.email,
    required this.password,
    AuthUserEntity? authUserEntity,
  }) : super(authUserEntity: authUserEntity);
}

class LoginByEmail extends AuthEvent {
  final String email;
  final String password;

  const LoginByEmail({
    required this.email,
    required this.password,
  });
}

class LoginByPhone extends AuthEvent {
  final String phone;

  const LoginByPhone({
    required this.phone,
  });
}

class SelectLoginBy extends AuthEvent {
  final int idSelected;
  const SelectLoginBy({
    required this.idSelected,
  });
}

class ChangeLoading extends AuthEvent {
  final bool isLoading;
  const ChangeLoading({
    required this.isLoading,
  });
}

class ChangeEmail extends AuthEvent {
  final String email;
  const ChangeEmail({
    required this.email,
  });
}

class ChangePassword extends AuthEvent {
  final String password;
  const ChangePassword({
    required this.password,
  });
}
