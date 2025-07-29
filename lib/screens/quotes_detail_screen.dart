import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness_flutter_project/screens/dashboard_screen.dart';

class QuotesDetailScreen extends StatefulWidget {
  const QuotesDetailScreen({super.key});

  @override
  State<QuotesDetailScreen> createState() => _QuotesDetailScreenState();
}

class _QuotesDetailScreenState extends State<QuotesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 24),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreens()),
            );
          },
        ),
        centerTitle: true,

        title: Text("Motivation", style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "1/15",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            right: 5.w,
            child: CircleAvatar(
              radius: 30.r,
              backgroundColor: Colors.grey[900],

              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.volume_up, size: 28.sp),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "'The only way to do great work\nis to love what you do.'",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "- Steve Jobs",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.swipe_up_outlined,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Swipe up",
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 33.sp,
                          ),
                          Icon(Icons.loyalty, color: Colors.white, size: 33.sp),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
