import 'package:equatable/equatable.dart';

abstract class PhoneLoginState extends Equatable {
  const PhoneLoginState({this.phone = '', this.errorMessage = ''});

  final String phone;
  final String errorMessage;

  @override
  List<Object?> get props => [phone, errorMessage];
}

class InitialPhoneLoginState extends PhoneLoginState {
  const InitialPhoneLoginState() : super();
}

class ValidPhoneState extends PhoneLoginState {
  const ValidPhoneState() : super();
}

class ErrorPhoneState extends PhoneLoginState {
  const ErrorPhoneState(String msgError) : super(errorMessage: msgError);
}

class ChangeInputState extends PhoneLoginState {
  const ChangeInputState(String valPhone) : super(phone: valPhone);
}
