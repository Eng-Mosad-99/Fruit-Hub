import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subtitle,
    required this.title,
  });
  final String image, backgroundImage;
  final String subtitle;
  final Widget title;
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
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text('تخط',),
              ),
            ],
          ),
        ),
        // const SizedBox(
        //   height: 40,
        // ),

        // SvgPicture.asset(
        //   image,
        //   height: 250,
        // ),
        // const SizedBox(
        //   height: 20,
        // ),
        // title,
        // const SizedBox(
        //   height: 10,
        // ),
        //  Padding(
        //   padding:const EdgeInsets.symmetric(horizontal: 20),
        //   child: Text(
        //  subtitle,
        //     textAlign: TextAlign.center,
        //     style:const TextStyle(
        //       fontSize: 16,
        //       color: Colors.grey,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
