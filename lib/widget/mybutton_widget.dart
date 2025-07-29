import 'package:flutter/material.dart';

class MybuttonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const MybuttonWidget({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Icon(Icons.arrow_back_ios_new, size: 23, color: Colors.white),
    );
  }
}
