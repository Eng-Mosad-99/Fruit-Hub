import 'dart:developer';
import 'package:dartz/dartz.dart';
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
    try {
      final user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel = UserModel.fromFirebaseUser(user);
      addUserData(user: userModel);
      return Right(userModel);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(
        ServerFailure(
          'An unknown error occurred in createUserWithEmailAndPassword ==> ${e.toString()}',
        ),
      );
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
      UserModel userModel = UserModel.fromFirebaseUser(user);
      return Right(userModel);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(
        ServerFailure(
          'An unknown error occurred in signInWithEmailAndPassword ==> ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    try {
      final user = await firebaseAuthService.signInWithGoogle();
      UserModel userModel = UserModel.fromFirebaseUser(user);
      return Right(userModel);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(
        ServerFailure(
          'An unknown error occurred in signInWithGoogle ==> ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    try {
      final user = await firebaseAuthService.signInWithFacebook();
      UserModel userModel = UserModel.fromFirebaseUser(user);
      return Right(userModel);
    } on CustomException catch (e) {
      log('Custom Exception ==> ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in Facebook Signin ==> ${e.toString()}');
      return Left(
        ServerFailure(
          'An unknown error occurred in signInWithFacebook ==> ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithApple() async {
    try {
      final user = await firebaseAuthService.signInWithApple();
      UserModel userModel = UserModel.fromFirebaseUser(user);
      return Right(userModel);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in signInWithApple ==> ${e.toString()}');
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
    );
  }
}
