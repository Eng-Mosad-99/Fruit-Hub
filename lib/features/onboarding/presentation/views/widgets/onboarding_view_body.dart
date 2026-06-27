import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/core/routes/routes.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/services/shared_prefs_singleton.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'onboarding_page_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnboardingPageView(pageController: pageController)),
        DotsIndicator(
          dotsCount: 2,
          position: 0,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: currentPage == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(.5),
          ),
        ),
          const SizedBox(height: 30),
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainSize: true,
          maintainState: true,
          maintainAnimation: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalPadding,
            ),
            child: CustomButtons(
              text: 'ابدأ الان',
              onPressed: () {
                PrefsSingleton.setBool(KIsOnBoardingViewSeen, true);
                Navigator.pushReplacementNamed(
                  context,
                  Routes.loginRoute,
                );
              },
            ),
          ),
        ),
         const SizedBox(height: 35),
      ],
    );
  }
}
