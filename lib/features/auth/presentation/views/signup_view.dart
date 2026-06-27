import 'package:flutter/material.dart';
import '../../../../core/widgets/build_appbar.dart';
import 'widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'حساب جديد'),
      body: const SignUpViewBodyBlocConsumer(),
    );
  }
}

