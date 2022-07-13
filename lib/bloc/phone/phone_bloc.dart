import 'package:ecommerce_flutter/bloc/phone/phone_event.dart';
import 'package:ecommerce_flutter/bloc/phone/phone_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneLoginBloc extends Bloc<PhoneLoginEvent, PhoneLoginState> {
  PhoneLoginBloc() : super(const InitialPhoneLoginState()) {
    on<ChangePhone>(_changePhone);
  }

  void _changePhone(ChangePhone event, Emitter<PhoneLoginState> emit) async {
    if (event.phone.isEmpty) {
      emit(const ErrorPhoneState('Nomor handphone tidak boleh kosong'));
    } else if (event.phone.length < 11) {
      emit(const ErrorPhoneState('Nomor handphone terlalu pendek'));
    } else {
      emit(const ValidPhoneState());
    }
  }
}
