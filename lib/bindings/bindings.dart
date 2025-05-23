import 'package:get/get.dart';
import 'package:route_roster_pro/modules/guardian/controller/bus_status_controller.dart';
import 'package:route_roster_pro/modules/guardian/controller/bus_status_controller.dart';
import 'package:route_roster_pro/modules/guardian/controller/profile_controller.dart';
import 'package:route_roster_pro/modules/guardian/controller/profile_controller.dart';
import 'package:route_roster_pro/modules/guardian/controller/settings_controller.dart';
import 'package:route_roster_pro/modules/guardian/controller/settings_controller.dart';
import '../modules/bottom_screen/controller/bottom_bar_controller.dart';
import '../modules/coordinator/controller/bus_status_controller.dart';
import '../modules/coordinator/controller/profile_controller.dart';
import '../modules/coordinator/controller/settings_controller.dart';
import '../modules/driver/track_screen/controller/track_controller.dart';
import '../modules/login_screen/controller/login_controller.dart';
import '../modules/splash_screen/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}

class BottomNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomBarController>(
      () => BottomBarController(),
    );
  }
}

class TrackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackController>(
          () => TrackController(),
    );
  }
}

class GuardianBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusStatusController>(
          () => BusStatusController(),
    );
    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
    Get.lazyPut<SettingsController>(
          () => SettingsController(),
    );
  }
}



class CoordinatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoordinatorBusStatusController>(
          () => CoordinatorBusStatusController(),
    );
    Get.lazyPut<CoordinatorProfileController>(
          () => CoordinatorProfileController(),
    );
    Get.lazyPut<CoordinatorSettingsController>(
          () => CoordinatorSettingsController(),
    );
  }
}
