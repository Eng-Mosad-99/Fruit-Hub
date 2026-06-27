import 'package:flutter/material.dart';
import '../../../../core/widgets/build_appbar.dart';
import 'widgets/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'تسجيل الدخول'),
      body: LoginViewBodyBlocConsumer(),
    );
  }
}

