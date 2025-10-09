import 'package:flutter/material.dart';
import 'package:fruit_hub/features/on_boarding/presentation/widgets/page_view_item.dart';

import '../../../../core/utils/app_images.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        // PageViewItem(
        //   image: Assets.imagesPageViewItem1Image,
        //   backgroundImage: Assets.imagesPageViewItem1BackgroundImage,
        //   title: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: const [
        //       Text(
        //         'مرحبًا بك في',
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 30,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       Text(
        //         'Fruit',
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 30,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       Text(
        //         'HUB',
        //         style: TextStyle(
        //           color: Color(0xFFFFC107),
        //           fontSize: 30,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ],
        //   ),
        //   subtitle:
        //       'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
        // ),
      ],
    );
  }
}
