// import 'package:flutter/material.dart';
// import 'package:wasallny/constants/my_constants.dart';

// class OtpIntroText extends StatelessWidget {
//   OtpIntroText({super.key});
//    String? phoneNumber;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'What is your phone number',
//           style: TextStyle(
//               color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(
//           height: 30,
//         ),
//         Container(
//           margin: const EdgeInsets.symmetric(horizontal: 2),
//           child: RichText(
//             text: TextSpan(
//               text: 'Enter your 6 digit code numbers sent to',
//               style:const TextStyle(color: Colors.black, fontSize: 18, height: 1.4),
//               children: <TextSpan>[
//                 TextSpan(
//                   text: ' $phoneNumber',
//                   style: const TextStyle(
//                     color:MyColors.blue,
//                     fontSize: 18
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
