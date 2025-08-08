import 'package:flutter/material.dart';
import 'package:welness_flutter_project/screens/admin_dashboard_screen.dart';

class AdminQuoteScreen extends StatefulWidget {
  AdminQuoteScreen({super.key});

  @override
  State<AdminQuoteScreen> createState() => _AdminQuoteScreenState();
}

class _AdminQuoteScreenState extends State<AdminQuoteScreen> {
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _quoteController = TextEditingController();

  final List<String> _categories = [
    'Quotes',
    'Motivation',
    'Life',
    'Love',
    'Humor',
    'Wisdom',
  ];

  String _selectedCategory = 'Quotes';

  @override
  void dispose() {
    _authorController.dispose();
    _quoteController.dispose();
    super.dispose();
  }

  void _saveQuote() {
    final author = _authorController.text.trim();
    final quote = _quoteController.text.trim();
    final category = _selectedCategory;

    if (author.isEmpty || quote.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('All fields are required')));
      return;
    }

    debugPrint(
      'Quote Saved → Category: $category | Author: $author | Quote: $quote',
    );
  }

  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: Colors.white),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Add Quotes", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Category:",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              dropdownColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF1E1E1E),
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
                border: borderStyle,
              ),
              value: _selectedCategory,
              style: TextStyle(color: Colors.white),
              items: _categories.map((item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
            ),
            SizedBox(height: 24),
            Text(
              "Author Name:",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _authorController,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Author Name",
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Color(0xFF1E1E1E),
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Quote:",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _quoteController,
              cursorColor: Colors.white,
              maxLines: 6,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Write a quote",
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Color(0xFF1E1E1E),
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );
                },
                child: Text("Save Quote"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
