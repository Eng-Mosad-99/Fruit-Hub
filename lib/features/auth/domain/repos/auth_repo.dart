import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/features/auth/domain/enitites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure,UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
}
