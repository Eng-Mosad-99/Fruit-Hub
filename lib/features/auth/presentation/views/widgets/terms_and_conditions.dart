
import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_styles.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(14, 0),
      child: Row(
        children: [
          Checkbox(
            value: true,
            onChanged: (value) {},
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width - (kHorizontalPadding * 2) - 48,
            child: Text.rich(
              TextSpan(
                text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                style: TextStyles.semiBold13.copyWith(
                  color: const Color(0xff949D9E),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'الشروط والأحكام الخاصة بنا',
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
            )),
          )
        ],
      ),
    );
  }
}


// class TermsAndConditions extends StatelessWidget {
//   const TermsAndConditions({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Checkbox(
//           value: true,
//           onChanged: (value) {},
//         ),
//         Text.rich(
//           TextSpan(
//             text: 'من خلال إنشاء حساب ، فإنك توافق على ',
//             style: TextStyles.semiBold13.copyWith(
//               color: const Color(0xff949D9E),
//             ),
//             children: <TextSpan>[
//               TextSpan(
//                 text: 'الشروط \n والأحكام الخاصة بنا',
//                 style: TextStyles.semiBold13.copyWith(
//                   color: AppColors.lightPrimaryColor,
//                 ),
//               ),
//             ],
//         ))
//       ],
//     );
//   }
// }
