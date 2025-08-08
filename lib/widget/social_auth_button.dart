import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SocialAuthButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      icon: Icon(Icons.login),
      label: Text('Sign in with Google'),
      onPressed: onPressed,
    );
  }
}
