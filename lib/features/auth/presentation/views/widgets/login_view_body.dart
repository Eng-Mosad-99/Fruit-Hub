import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/core/widgets/password_field.dart';
import 'package:fruits_ecommerce_app/features/auth/presentation/controller/signin_cubit/signin_cubit.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';
import 'dont_have_an_account.dart';
import 'or_divider.dart';
import 'social_login.dart';

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
              const SizedBox(height: 24),
              CustomTextField(
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
                onSaved: (emailAddress) {
                  email = emailAddress!;
                },
              ),
              const SizedBox(height: 16),
              PasswordField(
                onSaved: (passwordValue) {
                  password = passwordValue!;
                },
              ),
              const SizedBox(height: 16),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 33),
              CustomButtons(
                text: 'تسجيل دخول',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<SigninCubit>().signInWithEmailAndPassword(
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
              const SizedBox(height: 33),
              const DontHaveAnAccount(),
              const SizedBox(height: 33),
              const OrDivider(),
              const SizedBox(height: 16),
              SocialLogin(
                title: 'تسجيل بواسطة جوجل',
                image: Assets.imagesGoogleIcon,
                onPressed: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
              ),
              const SizedBox(height: 16),
              Platform.isIOS
                  ? Column(
                      children: [
                        SocialLogin(
                          title: 'تسجيل بواسطة أبل',
                          image: Assets.imagesAppleIcon,
                          onPressed: () {
                            context.read<SigninCubit>().signInWithApple();
                          },
                        ),
                        const SizedBox(height: 16),
                      ],
                    )
                  : const SizedBox.shrink(),

              SocialLogin(
                title: 'تسجيل بواسطة فيسبوك',
                image: Assets.imagesFacebookIcon,
                onPressed: () {
                  context.read<SigninCubit>().signInWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
