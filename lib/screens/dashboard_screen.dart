import 'package:flutter/material.dart';
import 'package:welness_flutter_project/screens/profile_screen.dart';
import 'package:welness_flutter_project/screens/quotes_detail_screen.dart';

class DashboardScreens extends StatelessWidget {
  DashboardScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Explore',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("images/profile.png"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite_border, color: Colors.white),
                        SizedBox(height: 8),
                        Text(
                          'My favorites',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.notifications_none, color: Colors.white),
                        SizedBox(height: 8),
                        Text(
                          'Remind Me',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            Text(
              "Today's Quotes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuotesDetailScreen()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '"Your wellness is an investment, not an expense."\n\n- John Quelch ',
                  style: TextStyle(
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),

            // Quotes List
            Text(
              'Quotes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            buildTile(Icons.wb_sunny_outlined, 'Feeling blessed'),
            buildTile(Icons.favorite_border, 'Pride Month'),
            buildTile(Icons.star_border, 'Self-worth'),
            buildTile(Icons.favorite, 'Love'),

            SizedBox(height: 24),

            Text(
              'Health Tips',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            buildTile(Icons.wb_sunny_outlined, 'Breathe to Reset'),
          ],
        ),
      ),
    );
  }

  Widget buildTile(IconData icon, String title) {
    return SizedBox(
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(title, style: TextStyle(color: Colors.white)),
          trailing: Icon(Icons.chevron_right, color: Colors.white),
          onTap: () {},
        ),
      ),
    );
  }
}
