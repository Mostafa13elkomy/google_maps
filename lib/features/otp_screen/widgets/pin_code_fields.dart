// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:wasallny/constants/my_constants.dart';

// // ignore: must_be_immutable
// class PinCodeFields extends StatelessWidget {
//     PinCodeFields({super.key});
//     String? otpCode;

//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       child: PinCodeTextField(
//         appContext: context,
//         length: 6,
//         obscureText: false,
//         cursorColor: Colors.black,
//         keyboardType: TextInputType.number,
//         autoFocus: true,
//         animationType: AnimationType.scale,
//         pinTheme: PinTheme(
//             shape: PinCodeFieldShape.box,
//             borderRadius: BorderRadius.circular(5),
//             fieldHeight: 50,
//             fieldWidth: 40,
//             borderWidth: 1,
//             activeColor: MyColors.blue,
//             inactiveColor: MyColors.blue,
//             activeFillColor: MyColors.lightBlue,
//             inactiveFillColor: Colors.white,
//             selectedColor: MyColors.blue,
//             selectedFillColor: Colors.white),
//         animationDuration:const Duration(milliseconds: 300),
//         backgroundColor: Colors.white,
//         enableActiveFill: true,
//         onCompleted: (submitedCode) {
//           otpCode = submitedCode;
//           print("Completed");
//         },
//         onChanged: (value) {
//           print(value);
//         },
//       ),
//     );
//   }
// }
