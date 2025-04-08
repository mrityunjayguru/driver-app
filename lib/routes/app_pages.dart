import 'package:get/get.dart';
import 'package:route_roster_pro/modules/login_screen/view/login_screen.dart';

import '../bindings/bindings.dart';
import '../modules/bottom_screen/view/bottom_bar_view.dart';
import '../modules/splash_screen/view/splash_screen.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMBAR,
      page: () => BottomBarView(),
      binding: BottomNavigationBarBinding(),
    ),

  ];
}
