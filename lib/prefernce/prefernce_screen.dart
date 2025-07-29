import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness_flutter_project/screens/dashboard_screen.dart';
import 'package:welness_flutter_project/screens/login_screen.dart';
import 'package:welness_flutter_project/widget/mybutton_widget.dart';

class PrefernceScreen extends StatefulWidget {
  const PrefernceScreen({super.key});

  @override
  State<PrefernceScreen> createState() => _PrefernceScreenState();
}

class _PrefernceScreenState extends State<PrefernceScreen> {
  final List<String> topics = [
    "Hard times",
    "Working out",
    "Productivity",
    "Self-esteem",
    "Achieving goal",
    "Inspiration",
    "Letting go",
    "Love",
    "Realationships",
    "Faith & Spritiuality",
    "Positive thinking",
    "Stress & Anxiety",
  ];
  List<String> Selectedtopics = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: MybuttonWidget(
          label: "Back",
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
      ),

      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Select all the topics that motivates you",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  GridView.builder(
                    shrinkWrap:
                        true, // Ensures the GridView takes only the required space
                    physics:
                        NeverScrollableScrollPhysics(), // Prevents scrolling inside the GridView
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 items per row
                      crossAxisSpacing:
                          10.w, // Horizontal spacing between items
                      mainAxisSpacing: 10.h, // Vertical spacing between rows
                      childAspectRatio: 2.5.r,
                    ),
                    itemCount: topics.length,
                    itemBuilder: (context, index) {
                      final topic = topics[index];
                      final isSelected = Selectedtopics.contains(topic);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected
                                ? Selectedtopics.remove(topic)
                                : Selectedtopics.add(topic);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.w,
                            horizontal: 16.h,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.white : Colors.grey[900],
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.grey.shade800,
                              width: 1.5.w,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              topic,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: isSelected ? Colors.black : Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20.h,
              right: 0,
              left: 0,
              child: Center(
                child: SizedBox(
                  width: 320.w,
                  height: 50.h,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreens(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      overlayColor: Colors.white,
                      backgroundColor: Colors.grey[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Popppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
