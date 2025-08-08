import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QuotesByPreferenceScreen extends StatefulWidget {
  const QuotesByPreferenceScreen({super.key});

  @override
  State<QuotesByPreferenceScreen> createState() =>
      _QuotesByPreferenceScreenState();
}

class _QuotesByPreferenceScreenState extends State<QuotesByPreferenceScreen> {
  List<String> userPreferences = [];
  List<Map<String, dynamic>> quotes = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    loadPreferencesAndQuotes();
  }

  Future<void> loadPreferencesAndQuotes() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        setState(() {
          errorMessage = "User not logged in.";
          isLoading = false;
        });
        return;
      }

      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (!userDoc.exists) {
        setState(() {
          errorMessage = "User data not found.";
          isLoading = false;
        });
        return;
      }

      final data = userDoc.data()!;
      final prefs = List<String>.from(data['preferences'] ?? []);

      if (prefs.isEmpty) {
        setState(() {
          errorMessage = "No preferences selected.";
          isLoading = false;
        });
        return;
      }

      final querySnapshot = await FirebaseFirestore.instance
          .collection('quotes')
          .where(
            'category',
            whereIn: prefs.length > 10 ? prefs.sublist(0, 10) : prefs,
          )
          .get();

      final fetchedQuotes = querySnapshot.docs
          .map((doc) => doc.data())
          .toList();

      setState(() {
        userPreferences = prefs;
        quotes = List<Map<String, dynamic>>.from(fetchedQuotes);
        isLoading = false;
        errorMessage = quotes.isEmpty
            ? "No quotes found for your preferences."
            : '';
      });
    } catch (e) {
      setState(() {
        errorMessage = "Error loading quotes: $e";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text("Quotes For You")),
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    if (errorMessage.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text("Quotes For You")),
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Quotes For You")),
      backgroundColor: Colors.black,
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          final quote = quotes[index];
          return Card(
            color: Colors.grey[900],
            margin: EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(
                '"${quote['quote']}"',
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              subtitle: Text(
                "- ${quote['author'] ?? 'Unknown'}",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          );
        },
      ),
    );
  }
}
