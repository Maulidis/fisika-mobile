// import 'package:fisika_mobile_app/app/constans.dart';
// import 'package:fisika_mobile_app/main.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//  void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => MyApp()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kBlue,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/images/welcome image.png',
//             height: 150,
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           if (defaultTargetPlatform == TargetPlatform.android)
//             const CupertinoActivityIndicator(
//               color: kWhite,
//               radius: 20,
//             )
//           else
//             const CircularProgressIndicator(
//               color: kWhite,
//             ),
//         ],
//       ),
//     );
//   }
// }
