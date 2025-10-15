 import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar buildAppBar({
    required BuildContext context,
    required String title,
  }) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_ios_new,
        ),
      ),
      title: Text(
        title,
        style: TextStyles.bold19,
      ),
    );
  }
