import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness_flutter_project/screens/login_screen.dart';
import 'package:welness_flutter_project/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
            scaffoldBackgroundColor: Colors.black,
            colorScheme: ColorScheme.dark(secondary: Color(0xFF262626)),
            iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                iconColor: WidgetStateProperty.all(Colors.white),
              ),
            ),
            iconTheme: IconThemeData(color: Colors.white),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.black,
              titleTextStyle: TextStyle(fontSize: 20.sp, color: Colors.white),
            ),
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.grey,
              elevation: 3.sp,
            ),
            inputDecorationTheme: InputDecorationTheme(
              fillColor: Colors.grey,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
              ),
              hintStyle: TextStyle(color: Colors.grey),
            ),
            timePickerTheme: TimePickerThemeData(
              dialBackgroundColor: Colors.black,
              dialHandColor: Colors.white,
              dialTextColor: Colors.white,
              entryModeIconColor: Colors.white,
              helpTextStyle: TextStyle(color: Colors.grey),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24.r)),
              ),
            ),
            textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
            hoverColor: Colors.transparent,
          ),
          home: child,
        );
      },
      child: SplashScreen(),
    );
  }
}
