import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    // this.onTap,
  });
  final bool isChecked;
  final ValueChanged<bool> onChanged;
//  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      // onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color:
                  isChecked ? AppColors.primaryColor : const Color(0xffDCDEDE),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          color: isChecked ? AppColors.primaryColor : Colors.white,
        ),
        child: isChecked
            ? Padding(
                padding: const EdgeInsets.all(2),
                child: SvgPicture.asset(
                  Assets.imagesCheckIcon,
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
