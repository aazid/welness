import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadQuotesScreen extends StatelessWidget {
  Future<void> uploadQuotes(BuildContext context) async {
    final String jsonString = await rootBundle.loadString(
      'assets/json/quotes.json',
    );
    final List<dynamic> quotesList = jsonDecode(jsonString);

    for (var item in quotesList) {
      await FirebaseFirestore.instance.collection('quotes').add({
        'quote': item['quote'],
        'author': item['author'],
        'category': item['category'],
      });
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Quotes uploaded successfully!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Upload Quotes")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => uploadQuotes(context),
          child: Text("Upload All Quotes"),
        ),
      ),
    );
  }
}
