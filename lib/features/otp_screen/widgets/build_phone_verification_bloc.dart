// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:wasallny/constants/my_strings.dart';
// import 'package:wasallny/features/otp_screen/manager/cubit/phone_auth_cubit.dart';

// // ignore: must_be_immutable
// class BuildPhoneVerificationBloc extends StatelessWidget {
//     BuildPhoneVerificationBloc({super.key});
//     late  String phoneNumber;

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<PhoneAuthCubit, PhoneAuthState>(
//       listenWhen: (previous, current) {
//         return previous != current;
//       },
//       listener: (context, state) {
//         if (state is PhoneAuthLoading) {
//           showProgressIndicator(context);
//         }
//         if (state is PhoneOtpVerified) {
//           Navigator.pop(context);
//           Navigator.of(context).pushReplacementNamed(otpScreen);
//         }
//         if (state is PhoneAuthFailure) {
//           Navigator.pop(context);
//           String errMessage = (state).errMessage;
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content:
//             Text(errMessage),
//             backgroundColor: Colors.black,
//             duration:const Duration(seconds: 3),
//             ),
//           );
          
//         }
//       },
//       child: Container(),
//     );
//   }

//   void showProgressIndicator(BuildContext context) {
//     AlertDialog alertDialog = const AlertDialog(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       content: Center(
//         child: CircularProgressIndicator(
//           valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
//         ),
//       ),
//     );
//     showDialog(
//       barrierColor: Colors.white.withOpacity(0),
//       barrierDismissible: false,
//       context: context,
//       builder: (context) {
//         return alertDialog;
//       },
//     );
//   }
// }

