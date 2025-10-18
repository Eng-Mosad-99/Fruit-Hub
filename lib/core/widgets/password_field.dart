import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
      onSaved: widget.onSaved,
      obscureText: obscureText,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: Icon(
          obscureText ? Icons.visibility_off : Icons.remove_red_eye,
          color: obscureText ?  const Color(0xffC9CECF):Colors.black ,
        ),
      ),
    );
  }
}
