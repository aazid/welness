
// import 'package:flutter/material.dart';
// import 'package:welness_flutter_project/prefernce/prefernce_screen.dart';
// import 'package:welness_flutter_project/screens/dashboard_screen.dart';
// import 'package:welness_flutter_project/screens/forgot_password_screen.dart';
// import 'package:welness_flutter_project/screens/login_screen.dart' show LoginScreen;
// import 'package:welness_flutter_project/screens/profile_screen.dart';
// import 'package:welness_flutter_project/screens/quotes_detail_screen.dart';
// import 'package:welness_flutter_project/screens/signup_screen.dart';
// import 'package:welness_flutter_project/screens/splash_screen.dart';
// import 'package:welness_flutter_project/screens/upload_quotes_screen.dart';

// class AppRoutes {
//   static const String splash = '/splash';
//   static const String login = '/login';
//   static const String home = '/home';
//   static const String forgotpassword = '/forgot-password';
//   static const String signup = '/signup';
//   static const String preference = '/preference';
//   static const String quote = '/quote';
//   static const String dashboard = '/dashboard';
//   static const String profile = "/profile";
//   static const String quotesDetails = "/quotes-details";

//   static Map<String, WidgetBuilder> getRoutes() {
//     return {
//       splash: (context) => const SplashScreen(),
//       login: (context) => const LoginScreen(),
//       forgotpassword: (context) => const ForgotPasswordScreen(),
//       signup: (context) => const SignupScreen(),
//       preference: (context) => PrefernceScreen(),
//       quote: (context) => QuotePage(
//         selectedTopics:
//             ModalRoute.of(context)!.settings.arguments as List<String>,
//       ),
//       dashboard: (context) => DashboardScreens(),
//       profile: (context) => ProfileScreen(),
//       quotesDetails: (context) => QuotesDetailsScreen(),
//     };
//   }
// }