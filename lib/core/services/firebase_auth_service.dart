import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';

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
      }else if(e.code == 'network-request-failed'){
        throw CustomException(message: 'يرجي التحقق من اتصالك بالانترنت');
      }
       else {
        throw CustomException(message: 'لقد حدث خطأ ما يرجي المحاولة مرة اخري');
      }
    } catch (e) {
      log('Exception In FirebaseAuthException.CreateUserWithEmailAndPassword: ${e.toString()}');
      throw CustomException(message: e.toString());
    }
  }
}
