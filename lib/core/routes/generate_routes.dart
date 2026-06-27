import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/core/di/setup_service_locator.dart';
import 'package:fruits_ecommerce_app/core/routes/routes.dart';
import 'package:fruits_ecommerce_app/features/auth/presentation/controller/signin_cubit/signin_cubit.dart';
import 'package:fruits_ecommerce_app/features/auth/presentation/controller/signup_cubit/signup_cubit.dart';
import 'package:fruits_ecommerce_app/features/splash/presentation/views/splash_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashRoute:
      return MaterialPageRoute(builder: (_) => SplashView());
    case Routes.onboardingRoute:
      return MaterialPageRoute(builder: (_) => const OnboardingView());
    case Routes.loginRoute:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<SigninCubit>(),
          child: const LoginView(),
        ),
      );

    case Routes.signUpRoute:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<SignupCubit>(),
          child: const SignupView(),
        ),
      );
    default:
      return null;
  }
}
