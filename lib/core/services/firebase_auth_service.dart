import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';

class FirebaseAuthService {

  Future<User> createUserWithEmailAndPassword({
    required String email, 
    required String password
  }) async {
    try {
     final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthException(e);
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  
  CustomException _handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return CustomException(message: 'Password is too weak.');
      case 'email-already-in-use':
        return CustomException(message: 'Email is already in use.');
      case 'user-not-found':
        return CustomException(message: 'No user found with this email.');
      case 'wrong-password':
        return CustomException(message: 'Wrong password provided.');
      case 'invalid-email':
        return CustomException(message: 'Invalid email address.');
      default:
        return CustomException(message: e.message ?? 'Authentication failed.');
    }
  }
}