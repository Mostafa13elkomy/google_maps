part of 'phone_auth_cubit.dart';

@immutable
sealed class PhoneAuthState {}

class PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthLoading extends PhoneAuthState {}

class PhoneAuthFailure extends PhoneAuthState {
  final String errMessage;

  PhoneAuthFailure({required this.errMessage});
}

class PhoneSubmited extends PhoneAuthState {}

class PhoneOtpVerified extends PhoneAuthState {}
