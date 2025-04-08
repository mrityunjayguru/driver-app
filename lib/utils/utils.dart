import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/theme/app_colors.dart';
import 'common_import.dart';

class Utils{

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
    return  await Geolocator.openLocationSettings();

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
                backgroundColor: AppColors.color_f6f8fc,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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

  static Future<void> launchLink(String url,{bool showError = false}) async {
    if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
    } else {
      if(showError){
        Utils.getSnackbar(
            "Error", "Unable to fetch report, Please try later");
      }
    throw 'Could not launch $url';
    }
  }

  static void getSnackbar(String title, String message){
    Get.snackbar(title, message, backgroundColor: AppColors.black, colorText: AppColors.primaryColor,snackPosition: SnackPosition.BOTTOM);
  }

  static String toStringAsFixed({String? data}){
    return data==null? "N/A" : (double.tryParse(data) ?? 0).toStringAsFixed(1);
  }

  static  formatInt({String? data}){
    return data==null? "N/A" : (double.tryParse(data) ?? 0).toInt().toString();
  }

  static double parseDouble({String? data}){

    return data==null ? 0 : (double.tryParse(data) ?? 0);
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
}