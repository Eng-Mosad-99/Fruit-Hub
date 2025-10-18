import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:fruit_hub/core/widgets/password_field.dart';
import 'package:fruit_hub/features/auth/presentation/manager/cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_login.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'dont_have_an_account.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
                onSaved: (emailAddress) {
                  email = emailAddress!;
                },
              ),
              const SizedBox(height: 16),
              // const CustomTextField(
              //   hintText: 'كلمة المرور',
              //   textInputType: TextInputType.visiblePassword,
              //   suffixIcon: Icon(
              //     Icons.remove_red_eye,
              //     color: Color(0xffC9CECF),
              //   ),
              // ),
              PasswordField(
                onSaved: (passwordValue) {
                  password = passwordValue!;
                },
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<LoginCubit>().signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.onUserInteraction;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 33,
              ),
              const DontHaveAnAccount(),
              const SizedBox(
                height: 33,
              ),
              const OrDivider(),
              const SizedBox(
                height: 16,
              ),
              SocialLogin(
                title: 'تسجيل بواسطة جوجل',
                image: Assets.imagesGoogleIcon,
                onPressed: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              SocialLogin(
                title: 'تسجيل بواسطة أبل',
                image: Assets.imagesAppleIcon,
                onPressed: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              SocialLogin(
                title: 'تسجيل بواسطة فيسبوك',
                image: Assets.imagesFacebookIcon,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
