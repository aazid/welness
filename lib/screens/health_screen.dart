import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddHealthTipsScreen extends StatefulWidget {
  const AddHealthTipsScreen({super.key});

  @override
  State<AddHealthTipsScreen> createState() => _AddHealthTipsScreenState();
}

class _AddHealthTipsScreenState extends State<AddHealthTipsScreen> {
  final _tipController = TextEditingController();
  String _selectedCategory = "Health";
  final List<String> _categories = [
    "Health",
    "Fitness",
    "Diet",
    "Wellness",
    "Mindfulness",
  ];

  void _saveTip() async {
    final tip = _tipController.text.trim();
    final category = _selectedCategory;

    if (tip.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please enter a health tip.",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('health_tips').add({
        'tip': tip,
        'category': category,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Tip saved successfully!",
            style: TextStyle(color: Colors.green),
          ),
        ),
      );

      _tipController.clear();
      setState(() {
        _selectedCategory = "Health";
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error saving tip: $e")));
    }
  }

  @override
  void dispose() {
    _tipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const whiteBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Add Health Tip"),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select Category:",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                dropdownColor: Colors.black,
                decoration: const InputDecoration(
                  enabledBorder: whiteBorder,
                  focusedBorder: whiteBorder,
                  border: whiteBorder,
                ),
                style: const TextStyle(color: Colors.white),
                value: _selectedCategory,
                items: _categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(
                      category,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text("Health Tip:", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 8),
              TextField(
                controller: _tipController,
                cursorColor: Colors.white,
                maxLines: 6,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Write a health tip",
                  hintStyle: TextStyle(color: Colors.white54),
                  enabledBorder: whiteBorder,
                  focusedBorder: whiteBorder,
                  border: whiteBorder,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveTip,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[900],
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
