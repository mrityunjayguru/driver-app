import 'package:get/get.dart';
import '../modules/bottom_screen/controller/bottom_bar_controller.dart';
import '../modules/login_screen/controller/login_controller.dart';
import '../modules/splash_screen/controller/splash_controller.dart';
import '../modules/track_screen/controller/track_controller.dart';

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
