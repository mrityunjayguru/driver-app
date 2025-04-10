import 'package:sizer/sizer.dart';

import '../../../config/theme/app_colors.dart';
import '../../../config/theme/app_textstyle.dart';
import '../../../utils/common_import.dart';
import '../../../utils/utils.dart';

Widget peopleColumn(text1, text2, Color textColor) {
  return Expanded(
    child: Builder(builder: (context) {
      return Column(
        children: [
          Text(
            text1,
            style:
                AppTextStyles(context).display32W500.copyWith(color: textColor),
          ),
          Text(
            text2,
            style: AppTextStyles(context)
                .display14W400
                .copyWith(color: AppColors.color1E1E1E),
          )
        ],
      );
    }),
  );
}

Widget dataColumn(text1, text2) {
  return Expanded(
    child: Builder(builder: (context) {
      return Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: AppTextStyles(context)
                .display12W400
                .copyWith(color: AppColors.color949495),
          ),
          Text(
            text2,
            style: AppTextStyles(context).display14W600,
          )
        ],
      );
    }),
  );
}

Widget peopleRow(text1, text2) {
  return Builder(builder: (context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.colorF3F3F3,
          child: const Icon(
            Icons.person,
            color: AppColors.black,
          ),
        ),
        Expanded(child: Text(text1, style: AppTextStyles(context).display16W600).paddingSymmetric(horizontal: 10)),
        Container(
          width: 18.w,
          decoration: Utils()
              .commonDecoration(shadow: false, color: AppColors.colorF3F3F3),
          padding: const EdgeInsets.all(5),
          child: Center(
            child: Text(
              text2,
              style: AppTextStyles(context)
                  .display12W400
                  .copyWith(color: AppColors.black),
            ),
          ),
        ).paddingOnly(right: 10)
      ],
    ).paddingSymmetric(horizontal: 10);
  });
}
