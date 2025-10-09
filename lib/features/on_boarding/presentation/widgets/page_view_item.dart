import 'package:flutter/material.dart';
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
