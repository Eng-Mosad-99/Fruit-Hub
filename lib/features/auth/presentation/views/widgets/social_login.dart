import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin(
      {super.key, this.onPressed, required this.title, required this.image});
  final void Function()? onPressed;
  final String title, image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            side: const BorderSide(
              color: Color(0xffDCDEDE),
            )),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                image,
              ),
              const Spacer(),
              Text(
                title,
                style: TextStyles.semiBold16.copyWith(
                  color: Colors.black,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
