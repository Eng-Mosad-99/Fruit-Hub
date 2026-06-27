import 'package:fruits_ecommerce_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:fruits_ecommerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/presentation/controller/signin_cubit/signin_cubit.dart';
import '../../features/auth/presentation/controller/signup_cubit/signup_cubit.dart';
import '../services/database_service.dart';
import '../services/firebase_auth_service.dart';
import '../services/firestore_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  getIt.registerLazySingleton<DatabaseService>(() => FirestoreService());
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );

  getIt.registerFactory(() => SignupCubit(getIt<AuthRepo>()));
  getIt.registerFactory(() => SigninCubit(getIt<AuthRepo>()));
}
