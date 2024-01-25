// import 'package:flutter/material.dart';

// class CustomButton extends StatelessWidget {
//   const CustomButton(
//       {super.key,
//       required this.buttonText,
//       this.onPressed,
//       required this.buttonColor});
//   final String buttonText;
//   final void Function()? onPressed;
//   final Color? buttonColor;

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           minimumSize: const Size(100, 50),
//           backgroundColor: buttonColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(6),
//           ),
//         ),
//         child: Text(
//           buttonText,
//           style: const TextStyle(color: Colors.white, fontSize: 16),
//         ),
//       ),
//     );
//   }
// }
