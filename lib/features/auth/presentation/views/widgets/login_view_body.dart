import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/or_divider.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'dont_have_an_account.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 24,
            ),
            const CustomTextField(
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                'نسيت كلمة المرور؟',
                style: TextStyles.semiBold13.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            CustomButtons(
              text: 'تسجيل دخول',
              onPressed: () {},
            ),
            const SizedBox(
              height: 33,
            ),
            const DontHaveAnAccount(),
            const SizedBox(
              height: 33,
            ),
            const OrDivider(),
          ],
        ),
      ),
    );
  }
}

