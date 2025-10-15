import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../constants.dart';
import '../../../../core/services/shared_preferences_singleton.dart';
import '../../../auth/presentation/views/login_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              Assets.imagesPlanet,
            ),
          ],
        ),
        SvgPicture.asset(
          Assets.imagesPlanetLogo,
        ),
        SvgPicture.asset(
          Assets.imagesPlanetCircle,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void executeNavigation() {
    bool isOnBoardingViewVisited = PrefsSingleton.getBool(KIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        if (isOnBoardingViewVisited) {
          Navigator.pushReplacementNamed(
            context,
            LoginView.routeName,
          );
        } else {
          Navigator.pushReplacementNamed(
            context,
            OnBoardingView.routeName,
          );
        }
      },
    );
  }
}
