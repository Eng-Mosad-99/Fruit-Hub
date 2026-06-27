import 'package:bloc/bloc.dart';
import 'package:fruits_ecommerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';
import '../../../domain/entity/user_entity.dart';
part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SigninFailure(failure.message)),
      (user) => emit(SigninSuccess(user)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) {
        emit(SigninFailure(failure.message));
      },
      (user) {
        emit(SigninSuccess(user));
      },
    );
  }
  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) {
        emit(SigninFailure(failure.message));
      },
      (user) {
        emit(SigninSuccess(user));
      },
    );
  }
  Future<void> signInWithApple() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithApple();
    result.fold(
      (failure) {
        emit(SigninFailure(failure.message));
      },
      (user) {
        emit(SigninSuccess(user));
      },
    );
  }

}
