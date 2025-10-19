import 'package:bloc/bloc.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../domain/enitites/user_entity.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepo) : super(LoginInitial());
  final AuthRepo _authRepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final result = await _authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) {
        emit(LoginFailure(failure.message));
      },
      (user) {
        emit(LoginSuccess(user));
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    final result = await _authRepo.signInWithGoogle();
    result.fold(
      (failure) {
        emit(LoginFailure(failure.message));
      },
      (user) {
        emit(LoginSuccess(user));
      },
    );
  }

  Future<void> signInWithFacebook() async {
    emit(LoginLoading());
    final result = await _authRepo.signInWithFacebook();
    result.fold(
      (failure) {
        emit(LoginFailure(failure.message));
      },
      (user) {
        emit(LoginSuccess(user));
      },
    );
  }

  Future<void> signInWithApple() async {
    emit(LoginLoading());
    final result = await _authRepo.signInWithApple();
    result.fold(
      (failure) {
        emit(LoginFailure(failure.message));
      },
      (user) {
        emit(LoginSuccess(user));
      },
    );
  }
}
