import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness_flutter_project/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;
  bool passwordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h),
                  SizedBox(
                    height: 130,
                    child: Text(
                      "Start your wellness\njourney today.",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[900],
                        filled: true,
                        hintText: "Enter your name",
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[900],
                        filled: true,
                        hintText: "Enter your email",
                        prefixIcon: Icon(Icons.mail),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      controller: passwordController,
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[900],
                        filled: true,
                        hintText: "Enter your password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: Row(
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
                          "Remember me",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 45.h,
                    width: 250.w,
                    child: TextButton(
                      onPressed: () async {
                        final messenger = ScaffoldMessenger.of(context);
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();

                        if (email.isEmpty || password.isEmpty) {
                          messenger.showSnackBar(
                            SnackBar(
                              content: Text("All the details are mandatory"),
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
                                "Password must be at least 8 characters,\ninclude a number and a special character",
                                style: TextStyle(color: Colors.red),
                              ),
                              backgroundColor: Colors.white,
                            ),
                          );
                          return;
                        }

                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                email: email,
                                password: password,
                              );

                          messenger.showSnackBar(
                            SnackBar(
                              content: Text(
                                "Account created: ${userCredential.user!.email}",
                                style: TextStyle(color: Colors.grey),
                              ),
                              backgroundColor: Colors.black,
                            ),
                          );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        } on FirebaseAuthException catch (e) {
                          String message;
                          if (e.code == 'email-already-in-use') {
                            message = "This email is already in use.";
                          } else if (e.code == 'invalid-email') {
                            message = "Invalid email format.";
                          } else if (e.code == 'weak-password') {
                            message = "Password is too weak.";
                          } else {
                            message = e.message ?? "Signup failed.";
                          }

                          messenger.showSnackBar(
                            SnackBar(content: Text(message)),
                          );
                        } catch (e) {
                          messenger.showSnackBar(
                            SnackBar(
                              content: Text("Something went wrong. Try again."),
                            ),
                          );
                        }
                      },

                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        overlayColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.h,
                          vertical: 8.w,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),

                      child: Text(
                        "Sign up",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text("Or", style: TextStyle(color: Colors.white)),
                  SizedBox(height: 15.h),
                  SizedBox(
                    height: 45.h,
                    width: 250.w,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "images/icons.png",
                            color: Colors.grey,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10.w),

                          Text(
                            "Google",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 11.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an Account?"),

                      SizedBox(
                        width: 40.w,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              height: 1,
                              wordSpacing: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
