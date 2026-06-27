import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/features/auth/presentation/controller/signup_cubit/signup_cubit.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/helper/build_error_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';
import '../../../../../core/widgets/password_field.dart';
import 'have_an_account.dart';
import 'terms_and_condition.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
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
          autovalidateMode: autovalidateMode,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 24),
              CustomTextField(
                hintText: 'الاسم كامل',

                onSaved: (nameValue) {
                  name = nameValue!;
                },
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: 'البريد الإلكتروني',
                onSaved: (emailValue) {
                  email = emailValue!;
                },
                
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordField(
                onSaved: (passwordValue) {
                  password = passwordValue!;
                },
              ),
              const SizedBox(height: 16),
              TermsAndConditions(
                onChanged: (value) {
                  isTermsChecked = value;
                },
              ),
              const SizedBox(height: 30),
              CustomButtons(
                text: 'إنشاء حساب جديد',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsChecked) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                            name: name,
                          );
                    } else {
                      buildErrorBar(
                        context,
                        'يجب الموافقة على الشروط والأحكام للمتابعة',
                      );
                    }
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              ),
              const SizedBox(height: 25),
              const HaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
