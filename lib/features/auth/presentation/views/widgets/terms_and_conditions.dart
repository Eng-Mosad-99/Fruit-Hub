import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'custom_check_box.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isTermsChecked,
          onChanged: (value) {
            setState(() {
              isTermsChecked = value;
            });
          },
          // onTap: (){
          //   setState(() {
          //     isTermsChecked = !isTermsChecked;
          //   });
          // },
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text.rich(TextSpan(
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
