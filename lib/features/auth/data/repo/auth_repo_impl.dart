import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/enitites/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../core/services/database_service.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImpl(
      {required this.firebaseAuthService, required this.databaseService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception In AuthRepoImpl.CreateUserWithEmailAndPassword: ${e.toString()}');
      return left(
        const ServerFailure(
          'لقد حدث خطأ ما يرجي المحاولة مرة اخري',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception In AuthRepoImpl.SignInWithEmailAndPassword: ${e.toString()}');
      return left(
        const ServerFailure(
          'لقد حدث خطأ ما يرجي المحاولة مرة اخري',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await firebaseAuthService.signInWithGoogle();
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } catch (e) {
      log('Exception In AuthRepoImpl.SignInWithGoogle: ${e.toString()}');
      return left(
        const ServerFailure(
          'لقد حدث خطأ ما يرجي المحاولة مرة اخري',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      final user = await firebaseAuthService.signInWithFacebook();
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } catch (e) {
      log('Exception In AuthRepoImpl.SignInWithFacebook: ${e.toString()}');
      return left(
        const ServerFailure(
          'لقد حدث خطأ ما يرجي المحاولة مرة اخري',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    try {
      final user = await firebaseAuthService.signInWithApple();
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } catch (e) {
      log('Exception In AuthRepoImpl.SignInWithApple: ${e.toString()}');
      return left(
        const ServerFailure(
          'لقد حدث خطأ ما يرجي المحاولة مرة اخري',
        ),
      );
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
        path: BackendEndpoint.addUser, data: user.toMap());
  }
}
