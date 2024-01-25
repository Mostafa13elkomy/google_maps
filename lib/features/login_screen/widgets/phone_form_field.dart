// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class PhoneFormField extends StatelessWidget {
//     PhoneFormField({super.key});
//   String? phoneNumber;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//             flex: 1,
//             child: Container(
//               height: 60,
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.blue),
//                 borderRadius: const BorderRadius.all(Radius.circular(6),),
//               ),
//               child: Text(
//                 generateCountryFlag() + ' +20',
//                 style: const TextStyle(fontSize: 18, letterSpacing: 2.0),
//               ),
//             ),),
//         const SizedBox(
//           width: 16,
//         ),
//         Expanded(
//           flex: 2,
//           child: Container(
//             height: 60,
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.blue),
//               borderRadius: const BorderRadius.all(Radius.circular(6)),
//             ),
//             child: TextFormField(
//               maxLength: 11,
//               maxLines: 1,
//               autofocus: true,
//               style: const TextStyle(fontSize: 18, letterSpacing: 2.0),
//               decoration: const InputDecoration(border: InputBorder.none),
//               cursorColor: Colors.black,
//               keyboardType: TextInputType.number,
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter your phone number!';
//                 } else if (value.length < 11) {
//                   return ' This number is too short!';
//                 }
//                 return null;
//               },
//               onSaved: (newValue) {
//                 phoneNumber = newValue!;
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// String generateCountryFlag() {
//   String countryName = 'eg';
//   String flag = countryName.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
//       (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
//   return flag;
// }
