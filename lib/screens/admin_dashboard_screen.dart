import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Add Category",
          style: TextStyle(color: Colors.white, fontSize: 19.sp),
        ),
      ),

      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Icon(Icons.groups, color: Colors.white, size: 23)],
        ),
      ),
    );
  }
}
