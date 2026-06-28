import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_ecommerce_app/core/errors/failures.dart';
import 'package:fruits_ecommerce_app/core/services/database_service.dart';
import 'package:fruits_ecommerce_app/core/utils/backend_endpoints.dart';
import 'package:fruits_ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:fruits_ecommerce_app/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_ecommerce_app/features/auth/domain/repo/auth_repo.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/firebase_auth_service.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.databaseService,
  });
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(uId: user.uid, name: name, email: email);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return Left(
        ServerFailure(
          'An unknown error occurred in createUserWithEmailAndPassword ==> ${e.toString()}',
        ),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(uId: user.uid);
      return Right(userEntity);
    } on CustomException catch (e) {
      log('Custom Exception in signInWithEmailAndPassword ==> ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in signInWithEmailAndPassword ==> ${e.toString()}');
      return Left(
        ServerFailure(
          'An unknown error occurred in signInWithEmailAndPassword ==> ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      UserModel userModel = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.checkIfDataExists(
        path: BackendEndpoints.isUserExists,
        documentID: user.uid,
      );

      if (isUserExists) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userModel);
      }
      return Right(userModel);
    } on CustomException catch (e) {
      log('Custom Exception in signInWithGoogle ==> ${e.message}');
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in signInWithGoogle ==> ${e.toString()}');
      await deleteUser(user);
      return Left(
        ServerFailure(
          'An unknown error occurred in signInWithGoogle ==> ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      UserModel userModel = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.checkIfDataExists(
        path: BackendEndpoints.isUserExists,
        documentID: user.uid,
      );
      if (isUserExists) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userModel);
      }
      return Right(userModel);
    } on CustomException catch (e) {
      log('Custom Exception in signInWithFacebook ==> ${e.message}');
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in signInWithFacebook ==> ${e.toString()}');
      await deleteUser(user);
      return Left(
        ServerFailure(
          'An unknown error occurred in signInWithFacebook ==> ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithApple() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithApple();
      UserModel userModel = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.checkIfDataExists(
        path: BackendEndpoints.isUserExists,
        documentID: user.uid,
      );

      if (isUserExists) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userModel);
      }
      return Right(userModel);
    } on CustomException catch (e) {
      log('Custom Exception in signInWithApple ==> ${e.message}');
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in signInWithApple ==> ${e.toString()}');
      await deleteUser(user);
      return Left(
        ServerFailure(
          'An unknown error occurred in signInWithApple ==> ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoints.addUserData,
      data: user.toMap(),
      documentID: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoints.getUserData,
      documentID: uId,
    );
    return UserModel.fromJson(userData);
  }
}
