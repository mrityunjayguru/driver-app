import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:route_roster_pro/config/theme/app_textstyle.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/app_sizer.dart';
import '../config/theme/app_colors.dart';
import '../generated/assets.dart';
import 'common_import.dart';

class Utils {
  Future<String> getAddressFromLatLong(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];

      return "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";
    } catch (e) {
      return "Address not available";
    }
  }

  // Method to request location permission
  Future<bool> isPermissionGranted() async {
    return await Permission.locationWhenInUse.isGranted;
  }

  // Method to check if GPS is enabled
  Future<bool> isGpsEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  // Request to enable GPS
  Future<bool> requestEnableGps() async {
    return await Geolocator.openLocationSettings();
  }

  // Request location permission
  Future<bool> requestLocationPermission({bool updateCamera = true}) async {
    PermissionStatus permissionStatus =
        await Permission.locationWhenInUse.request();
    return permissionStatus == PermissionStatus.granted;
  }

  static Future openDialog({
    required BuildContext context,
    required Widget child,
  }) async {
    await showDialog(
      barrierDismissible: true,
      context: context,
      useRootNavigator: false,
      builder: (context) {
        return ScaffoldMessenger(
          child: Builder(builder: (context) {
            return Scaffold(
              backgroundColor: AppColors.transparent,
              body: Dialog(
                backgroundColor: AppColors.colorF6f8fc,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: child.paddingAll(0),
              ),
            );
          }),
        );
      },
    );
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    try {
      if (!await launchUrl(launchUri)) {
        throw 'Could not launch $launchUri';
      }
    } on PlatformException catch (e) {
      // print('Error: $e'); // Log the error to the console for debugging
    }
  }

  static Future<void> launchLink(String url, {bool showError = false}) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      if (showError) {
        Utils.getSnackbar("Error", "Unable to fetch report, Please try later");
      }
      throw 'Could not launch $url';
    }
  }

  static void getSnackbar(String title, String message) {
    Get.snackbar(title, message,
        backgroundColor: AppColors.black,
        colorText: AppColors.primaryColor,
        snackPosition: SnackPosition.BOTTOM);
  }

  static String toStringAsFixed({String? data}) {
    return data == null
        ? "N/A"
        : (double.tryParse(data) ?? 0).toStringAsFixed(1);
  }

  static formatInt({String? data}) {
    return data == null
        ? "N/A"
        : (double.tryParse(data) ?? 0).toInt().toString();
  }

  static double parseDouble({String? data}) {
    return data == null ? 0 : (double.tryParse(data) ?? 0);
  }

  static FilteringTextInputFormatter percentageFormatter() {
    return FilteringTextInputFormatter.allow(
      RegExp(r'^(100(\.0{0,2})?|([1-9]?[0-9])(\.\d{0,2})?)$'),
    );
  }

  static FilteringTextInputFormatter doubleFormatter() {
    return FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'));
  }

  static FilteringTextInputFormatter numLetterFormatter() {
    return FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'));
  }

  static TextInputFormatter intFormatter() {
    return FilteringTextInputFormatter.digitsOnly;
  }

  Widget topBar(String text, {bool backIcon = false, String? textRight}) {
    return Builder(builder: (context) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.all(7),
        decoration: commonDecoration(),
        child: Row(children: [
          SvgPicture.asset(Assets.svgAppIcon).paddingOnly(right: 16),
          Text(
            text,
            style: AppTextStyles(context)
                .display18W500
                .copyWith(color: AppColors.color2C2C2C),
          ),
          const Spacer(),
          if (backIcon) InkWell(onTap:(){Get.back();},child: SvgPicture.asset(Assets.svgIcBack, width: 24, height: 24,).paddingOnly(right: 5)),
          if (textRight != null)
            Text(
              textRight,
              style: AppTextStyles(context)
                  .display18W500
                  .copyWith(color: AppColors.primaryColor),
            ).paddingOnly(right: 10)
        ]),
      ).paddingOnly(top: 10);
    });
  }

  BoxDecoration commonDecoration({Color? color, bool shadow = true}) {
    return BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius_4),
        boxShadow: shadow
            ? [
                 BoxShadow(
                  color: const Color(0xFF000000).withOpacity(0.25), // Equivalent to #00000040
                  offset: const Offset (0, 1), // x: 0px, y: 1px
                  blurRadius: 8, // blur radius
                  spreadRadius: 0, // no spread
                ),
              ]
            : null);
  }


  Widget dottedLine({
    double width = double.infinity,
    double height = 1.0,
    double thickness = 0.5,
    Color? color,
    double dotSpacing = 4.0,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          int dotCount = (constraints.maxWidth / (dotSpacing * 2)).floor();
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(dotCount, (_) {
              return Container(
                width: dotSpacing,
                height: thickness,
                color: color ?? AppColors.color949495,
              );
            }),
          );
        },
      ),
    );
  }
  Widget verticalDottedLine({
    double height = 42,
    double thickness = 0.5,
    Color? color,
    double dotSpacing = 4.0,
  }) {
    return SizedBox(
      height: height,
      width: thickness,
      child: LayoutBuilder(
        builder: (context, constraints) {
          int dotCount = (constraints.maxHeight / (dotSpacing * 1.5)).floor();
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(dotCount, (_) {
              return Container(
                width: thickness,
                height: dotSpacing,
                color: color ?? AppColors.color949495,
              );
            }),
          );
        },
      ),
    );
  }

}
