import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:svg_flutter/svg.dart';

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
    Future.delayed(const Duration(seconds: 3)).then((value){
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName,);
    });
  }
}
