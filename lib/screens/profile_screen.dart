import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness_flutter_project/screens/dashboard_screen.dart';
import 'package:welness_flutter_project/screens/reset_password.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreens()),
            );
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 23),
        ),
        title: Text('Profile', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(14.0),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("images/profile.png"),
                ),
                title: Text(
                  "John Doe",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: 21,
                  ),
                ),
                subtitle: Text(
                  "john.doe@example.com",
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "MAKE IT YOURS",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "Poppins.bold",
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 15.h),
            buildTile(Icons.menu_book, "Content prefernces"),
            SizedBox(height: 20.h),
            Text(
              "Account",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                wordSpacing: 1,
              ),
            ),
            SizedBox(height: 20.h),
            buildTile(Icons.edit, "Theme"),
            SizedBox(height: 8.h),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetPasswordScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[900],
                minimumSize: Size(double.infinity, 50),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.lock_reset, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Reset Password",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 14.h),
            buildTile(Icons.logout_outlined, "Logout"),
          ],
        ),
      ),
    );
  }

  Widget buildTile(IconData icon, String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: TextStyle(color: Colors.white)),
        trailing: Icon(Icons.chevron_right, color: Colors.white),
        onTap: () {},
      ),
    );
  }
}
