import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:fruit_hub/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/password_field.dart';
import 'have_an_Account.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, email, password;
  late bool isTermsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                hintText: 'الاسم كامل',
                onSaved: (nameValue) {
                  name = nameValue!;
                },
                textInputType: TextInputType.name,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
                onSaved: (emailValue) {
                  email = emailValue!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordField(
                onSaved: (passwordValue) {
                  password = passwordValue!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TermsAndConditions(
                onChanged: (value) {
                  isTermsChecked = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButtons(
                text: 'إنشاء حساب جديد',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsChecked) {
                      context
                          .read<SignUpCubit>()
                          .createUserWithEmailAndPassword(
                              name, email, password);
                    } else {
                      buildErrorBar(
                          context, 'يجب الموافقة على الشروط والأحكام للمتابعة');
                    }
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              ),
              const SizedBox(
                height: 25,
              ),
              const HaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
