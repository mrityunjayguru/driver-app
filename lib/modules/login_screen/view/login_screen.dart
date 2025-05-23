import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_roster_pro/utils/enums.dart';
import 'package:sizer/sizer.dart';

import '../../../config/app_sizer.dart';
import '../../../config/theme/app_colors.dart';
import '../../../config/theme/app_textstyle.dart';
import '../../../generated/assets.dart';
import '../../../utils/apptextfield.dart';
import '../../../utils/common_import.dart';
import '../controller/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.backgroundDark,
          body: Column(
            children: [
              Center(child: SvgPicture.asset(Assets.svgAppLogo))
                  .paddingOnly(top: 100, bottom: 45),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Obx(
                        () => Text(
                          controller.loginType.value == LoginType.guardian
                              ? "Login"
                              : "Onboard",
                          style: AppTextStyles(context)
                              .display32W500
                              .copyWith(color: AppColors.colorD6D6D9),
                        ),
                      ),
                      Obx(
                        () => Text(
                          controller.loginType.value.name,
                          style: AppTextStyles(context)
                              .display52W500
                              .copyWith(color: AppColors.colorD6D6D9),
                        ),
                      ),
                      Obx(
                        () => AppTextFormField(
                          controller: controller.emailController,
                          hintText: "User ID",
                          errorText: controller.errorEmail.isNotEmpty
                              ? controller.errorEmail.value
                              : '',
                          onChanged: (_) {
                            controller.validateEmail();
                          },
                          border: Border.all(
                              width: 1,
                              color: controller.errorEmail.isNotEmpty
                                  ? Colors.red
                                  : Colors.transparent),
                        ),
                      ),
                      Obx(
                        () => AppTextFormField(
                          suffixIconHeight: 25,
                          onChanged: (value) {
                            controller.validatePassword();
                          },
                          obscureText: controller.obscureText.value,
                          onSuffixTap: () {
                            controller.obscureText.value =
                                !controller.obscureText.value;
                          },
                          suffixIcon: !controller.obscureText.value
                              ? 'assets/images/svg/eye_open_icon.svg'
                              : 'assets/images/svg/eye_close_icon.svg',
                          controller: controller.passwordController,
                          hintText: "Password",
                          // errorText: controller.errorPassword.isNotEmpty
                          //     ? controller.errorPassword.value
                          //     : '',
                          border: Border.all(
                              width: 1,
                              color: controller.errorPassword.isNotEmpty
                                  ? Colors.red
                                  : Colors.transparent),
                        ),
                      ),
                      Obx(
                        () {
                          return controller.isWrongUser.value
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(Assets.svgIcSad),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          'Whoops! The username or password entered is incorrect.',
                                          style: AppTextStyles(context)
                                              .display11W400
                                              .copyWith(
                                                  color: Color(0xffE92E19)),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : SizedBox.shrink();
                        },
                      ),
                      Obx(() => SizedBox(
                          height: controller.isWrongUser.value ? 4.h : 5.h)),
                      InkWell(
                        onTap: () {
                          controller.login();
                        },
                        child: Container(
                          height: 6.h,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppSizes.radius_4),
                            color: AppColors.primaryColor,
                          ),
                          child: Center(
                            child: Text(
                              "Login",
                              style: AppTextStyles(context).display18W500.copyWith(color: AppColors.white),
                            ),
                          ),
                        ),
                      ).paddingOnly(bottom: 10),
                      forgotPasswordMethod(context: context),
                      SizedBox(height: 5.h),
                      Spacer(),
                      Center(
                        child: Text(
                          "or login as",
                          style: AppTextStyles(context)
                              .display14W400
                              .copyWith(color: AppColors.color949495),
                        ),
                      ),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => controller.checkLoginType(
                                  controller.displayNameLeft.value),
                              child: Text(
                                controller.displayNameLeft.value.value,
                                style: AppTextStyles(context)
                                    .display16W400
                                    .copyWith(color: AppColors.primaryColor),
                              ),
                            ),
                            Container(
                              height: 24,
                              width: 1,
                              color: AppColors.colorD6D6D9,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                            ),
                            InkWell(
                              onTap: () => controller.checkLoginType(
                                  controller.displayNameRight.value),
                              child: Text(
                                controller.displayNameRight.value.value,
                                style: AppTextStyles(context)
                                    .display16W400
                                    .copyWith(color: AppColors.primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text:
                              'By submitting, I confirm that I have read, understood, and agree to the\n ',
                          style: AppTextStyles(context).display11W500.copyWith(
                                color: AppColors.color949495,
                              ),
                          children: [
                            TextSpan(
                                text: 'Terms of Use ',
                                style: AppTextStyles(context)
                                    .display11W500
                                    .copyWith(
                                      height: 2,
                                      color: AppColors.primaryColor,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {

                                  }),
                            TextSpan(
                              text: 'and ',
                              style:
                                  AppTextStyles(context).display11W500.copyWith(
                                        height: 2,
                                        color: AppColors.color949495,
                                      ),
                            ),
                            TextSpan(
                                text: 'Privacy Policy.',
                                style: AppTextStyles(context)
                                    .display11W500
                                    .copyWith(
                                      height: 2,
                                      color: AppColors.primaryColor,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                  }),
                          ],
                        ),
                      ).paddingOnly(bottom: 8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        /*   if (controller.showLoader.value)
            Positioned.fill(
              child: Container(
                alignment: Alignment.center,
                color: Colors.grey.withOpacity(0.7),
                child: LoadingAnimationWidget.threeArchedCircle(
                  color: AppColors.selextedindexcolor,
                  size: 50,
                ),
              ),
            )*/
      ],
    );
  }

  Widget forgotPasswordMethod({required BuildContext context}) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "Forgot Password?",
          style: AppTextStyles(context)
              .display14W400
              .copyWith(color: AppColors.color949495),
          children: [
            TextSpan(
              text: " " + "Click here to reset",
              style: AppTextStyles(context)
                  .display14W400
                  .copyWith(color: AppColors.primaryColor),
              // Clickable text style
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                },
            ),
          ],
        ),
      ),
    );
  }
}
