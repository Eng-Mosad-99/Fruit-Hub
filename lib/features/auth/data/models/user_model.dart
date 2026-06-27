import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity{
  UserModel({required super.uId, required super.name, required super.email});

  factory UserModel.fromFirebaseUser(user) {
    return UserModel(
      uId: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
  }
}