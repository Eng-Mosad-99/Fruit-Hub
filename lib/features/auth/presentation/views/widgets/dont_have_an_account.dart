import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../sign_up_view.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      
      TextSpan(
        text: 'لا تمتلك حساب؟',
        style: TextStyles.semiBold16.copyWith(
          color: const Color(0xff949D9E),
        ),
        children: <TextSpan>[
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {
              Navigator.pushNamed(context, SignUpView.routeName);
            },
            text: ' قم بإنشاء حساب',
            style: TextStyles.semiBold13.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
