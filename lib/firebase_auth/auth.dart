import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // 🔐 Sign In
  static Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return null; // Success
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password.';
      } else {
        return e.message ?? 'Login failed.';
      }
    } catch (e) {
      return 'Something went wrong.';
    }
  }

  static Future<String?> signup({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return null; // Success: account created
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Create Account failed';
    } catch (e) {
      return 'Something went wrong';
    }
  }

  static Future<String?> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      return null; // Success
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else {
        return e.message ?? 'Password reset failed.';
      }
    } catch (e) {
      return 'Something went wrong.';
    }
  }
}
