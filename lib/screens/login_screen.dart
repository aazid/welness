import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:welness_flutter_project/screens/forgot_password_screen.dart';

import 'package:welness_flutter_project/screens/signup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness_flutter_project/wrapper.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 180.h),
            Center(
              child: Text(
                "Welcome Back!",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins.bold',
                  fontWeight: FontWeight.bold,
                  fontSize: 34.h,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 8.w),
              child: TextFormField(
                cursorColor: Colors.white,
                controller: emailController,
                decoration: InputDecoration(
                  fillColor: Colors.grey[900],
                  filled: true,
                  hintText: "Enter your email",

                  prefixIcon: Icon(Icons.email, color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 1.w,
                    horizontal: 2.h,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 8.w),
              child: TextFormField(
                cursorColor: Colors.white,
                controller: passwordController,
                obscureText: !passwordVisible,
                decoration: InputDecoration(
                  fillColor: Colors.grey[900],
                  filled: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },

                    icon: Icon(
                      passwordVisible ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: "Enter your password",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                    side: BorderSide(color: Colors.white),
                  ),
                  Text(
                    " Remember  me",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins.regular",
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins.regular",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 9.h),
            SizedBox(
              width: 300.w,
              height: 50.h,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[900],
                  overlayColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.h,
                    vertical: 8.w,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: () async {
                  final messenger = ScaffoldMessenger.of(context);
                  final email = emailController.text.trim();
                  final password = passwordController.text;

                  if (email.isEmpty || password.isEmpty) {
                    messenger.showSnackBar(
                      SnackBar(
                        content: Text("Please enter email and password"),
                      ),
                    );
                    return;
                  }
                  final passwordRegex = RegExp(
                    r'^(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$',
                  );
                  if (!passwordRegex.hasMatch(password)) {
                    messenger.showSnackBar(
                      SnackBar(
                        content: Text(
                          "Password must be at least  8 characters,\ninclude a number and a special character",
                        ),
                      ),
                    );
                  }

                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                    messenger.showSnackBar(
                      SnackBar(
                        content: Text(
                          "Logged in as: ${userCredential.user!.email}",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.black,
                      ),
                    );

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Wrapper()),
                    );
                  } on FirebaseAuthException catch (e) {
                    String message;
                    if (e.code == 'user-not-found') {
                      message = "No user found for that email.";
                    } else if (e.code == 'wrong-password') {
                      message = "Incorrect password.";
                    } else {
                      message = e.message ?? "Login failed.";
                    }

                    messenger.showSnackBar(SnackBar(content: Text(message)));
                  } catch (e) {
                    messenger.showSnackBar(
                      SnackBar(
                        content: Text("Something went wrong. Try again."),
                      ),
                    );
                  }
                },

                child: Text('Login', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 10.h),
            Text("Or", style: TextStyle(color: Colors.white)),
            SizedBox(height: 10.h),
            SizedBox(
              width: 300.w,
              height: 50.h,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[900],
                  overlayColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.h,
                    vertical: 8.w,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {},
                child: Text("Google", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 11.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Account?",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text(
                      "Create an account",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
