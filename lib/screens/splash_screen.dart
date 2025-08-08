import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:welness_flutter_project/firebase_auth/auth.dart';
import 'package:welness_flutter_project/prefernce/prefernce_screen.dart';
import 'package:welness_flutter_project/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (AuthService.auth.currentUser == null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
        log("user anna");
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PrefernceScreen()),
        );
        log("user hai");
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
