import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness_flutter_project/screens/login_screen.dart';
// import 'package:firebase_core/firebase_core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        360,
        690,
      ), // Adjust this to match your design mockup
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
            scaffoldBackgroundColor: Colors.black,
            colorScheme: const ColorScheme.dark(secondary: Color(0xFF262626)),
            iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                iconColor: WidgetStateProperty.all(Colors.white),
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
              titleTextStyle: TextStyle(fontSize: 20, color: Colors.white),
            ),
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.grey,
              elevation: 3,
            ),
            inputDecorationTheme: const InputDecorationTheme(
              fillColor: Colors.grey,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              hintStyle: TextStyle(color: Colors.grey),
            ),
            timePickerTheme: const TimePickerThemeData(
              dialBackgroundColor: Colors.black,
              dialHandColor: Colors.white,
              dialTextColor: Colors.white,
              entryModeIconColor: Colors.white,
              helpTextStyle: TextStyle(color: Colors.grey),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
            ),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white),
            ),
            hoverColor: Colors.transparent,
          ),
          home: child,
        );
      },
      child: LoginScreen(),
    );
  }
}
