import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception In FirebaseAuthException.CreateUserWithEmailAndPassword: ${e.toString()} and code ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'لقد قمت بالتسجيل مسبقا يرجي تسجيل الدخول ');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'يرجي التحقق من اتصالك بالانترنت');
      } else {
        throw CustomException(message: 'لقد حدث خطأ ما يرجي المحاولة مرة اخري');
      }
    } catch (e) {
      log('Exception In FirebaseAuthException.CreateUserWithEmailAndPassword: ${e.toString()}');
      throw CustomException(message: e.toString());
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'لا يوجد مستخدم بهذا البريد الإلكتروني');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'كلمة المرور غير صحيحة');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'يرجي التحقق من اتصالك بالانترنت');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(message: 'بيانات تسجيل الدخول غير صحيحة');
      } else {
        log('Exception In FirebaseAuthException.SignInWithEmailAndPassword: ${e.toString()} and code ${e.code}');
        throw CustomException(message: 'لقد حدث خطأ ما يرجي المحاولة مرة اخري');
      }
    } catch (e) {
      log('Exception In FirebaseAuthException.SignInWithEmailAndPassword: ${e.toString()}');
      throw CustomException(message: e.toString());
    }
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    //! علشان لو انا محتاج اليوزر
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
}
