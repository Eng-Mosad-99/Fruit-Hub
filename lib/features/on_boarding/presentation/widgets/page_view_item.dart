import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/utils/app_text_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subtitle,
    required this.title, required this.isVisible,
  });
  final String image, backgroundImage;
  final String subtitle;
  final Widget title;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.5,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              Visibility(
                visible: isVisible,
                child:  Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'تخط',
                    style: TextStyles.regular13.copyWith(),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        title,
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 37,
          ),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13.copyWith(
              color: const Color(0xFF4E5456),
            ),
          ),
        ),
      ],
    );
  }
}
