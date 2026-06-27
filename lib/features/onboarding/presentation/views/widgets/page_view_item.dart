
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/services/shared_prefs_singleton.dart';
import '../../../../../core/utils/app_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.backgroundImage,
    required this.isVisible,
  });
  final Widget title;
  final String description, image, backgroundImage;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.45,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: SvgPicture.asset(image),
                ),
                Visibility(
                  visible: isVisible,
                  child: GestureDetector(
                    onTap: () {
                      PrefsSingleton.setBool(KIsOnBoardingViewSeen, true);
                      Navigator.pushReplacementNamed(context, Routes.loginRoute);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'تخط',
                        style: TextStyles.regular13.copyWith(
                          color: const Color(0xFF949D9E),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
          title,
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold13.copyWith(
                color: const Color(0xFF4E5456),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
