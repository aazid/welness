import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer';

class AuthService {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static User? get currentUser => auth.currentUser;
  static Stream<User?> get userChanges => auth.authStateChanges();

  // Email/Password Signup
  static Future<String?> signup({
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'email': email,
          'role': role,
          'preferences': [],
          'createdAt': FieldValue.serverTimestamp(),
        });
        return null;
      } else {
        return "User creation failed.";
      }
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Signup failed.";
    } catch (e) {
      print("Signup error: $e");
      return "Unexpected error occurred.";
    }
  }

  // Email/Password Sign In
  static Future<Map<String, dynamic>?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      if (user == null) return null;

      final doc = await _firestore.collection('users').doc(user.uid).get();
      if (!doc.exists) return null;

      final data = doc.data() as Map<String, dynamic>;
      return {'email': data['email'], 'role': data['role']};
    } on FirebaseAuthException catch (e) {
      throw e;
    } catch (e) {
      print("Login error: $e");
      throw Exception("Unexpected login error");
    }
  }

  // Google Sign-In
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        log("Google sign-in aborted by user");
        return null;
      }

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      log("Google authentication error: ${error}");
    }
  }

  static Future<List<String>> getUserPreferences() async {
    final uid = auth.currentUser?.uid;
    if (uid == null) return [];
    final doc = await _firestore.collection('users').doc(uid).get();
    if (!doc.exists) return [];
    final data = doc.data() as Map<String, dynamic>;
    final prefs = data['preferences'];
    if (prefs is List<dynamic>) {
      return prefs.map((e) => e.toString()).toList();
    }
    return [];
  }

  static Future<bool> updatePreferences(List<String> preferences) async {
    try {
      final uid = auth.currentUser?.uid;
      if (uid == null) return false;

      await _firestore.collection('users').doc(uid).update({
        'preferences': preferences,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      return true;
    } catch (e) {
      print("Preference update error: $e");
      return false;
    }
  }
}
