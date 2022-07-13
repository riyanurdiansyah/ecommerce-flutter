import 'package:equatable/equatable.dart';

abstract class PhoneLoginEvent extends Equatable {
  const PhoneLoginEvent();
  @override
  List<Object?> get props => [];
}

class ChangePhone extends PhoneLoginEvent {
  final String phone;
  const ChangePhone({required this.phone});
}

class LoginByPhone extends PhoneLoginEvent {
  final String phone;

  const LoginByPhone({required this.phone});
}
