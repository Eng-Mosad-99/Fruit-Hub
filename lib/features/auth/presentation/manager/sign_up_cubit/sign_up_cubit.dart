import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../domain/enitites/user_entity.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authRepo) : super(SignUpInitial());
  final AuthRepo _authRepo;

  Future<void> createUserWithEmailAndPassword(
      String name, String email, String password) async {
    emit(SignUpLoading());
    final result = await _authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) => emit(SignUpError(message: failure.message)),
      (user) => emit(SignUpSuccess(userEntity: user)),
    );
  }
}
