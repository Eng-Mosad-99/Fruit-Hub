import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/core/routes/routes.dart';
import 'package:svg_flutter/svg_flutter.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/services/shared_prefs_singleton.dart';
import '../../../../../core/utils/app_assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    executeNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(Assets.imagesPlanet),
        ),
        SvgPicture.asset(Assets.imagesPlanetLogo),
        SvgPicture.asset(Assets.imagesPlanetCircle, fit: BoxFit.fill),
      ],
    );
  }

  void executeNavigation() {
    var isOnBoardingViewSeen =
        PrefsSingleton.getBool(KIsOnBoardingViewSeen) ?? false;
    Future.delayed(const Duration(seconds: 2), () {
      if (isOnBoardingViewSeen) {
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      } else {
        Navigator.pushReplacementNamed(context, Routes.onboardingRoute);
      }
    });
  }
}
