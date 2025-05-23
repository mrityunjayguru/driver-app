import 'package:route_roster_pro/modules/coordinator/view/bus_status_view.dart';
import 'package:route_roster_pro/modules/coordinator/view/profile_view.dart';
import 'package:route_roster_pro/modules/coordinator/view/settings_view.dart';
import 'package:route_roster_pro/modules/guardian/view/bus_status_view.dart';
import 'package:route_roster_pro/modules/guardian/view/profile_view.dart';
import 'package:route_roster_pro/modules/guardian/view/settings_view.dart';

import '../../../utils/app_prefrance.dart';
import '../../../utils/common_import.dart';
import '../../coordinator/controller/bus_status_controller.dart';

class BottomBarController extends GetxController {
  RxString loginType = ''.obs;

  @override
  void onInit() {
    getLogin();
    super.onInit();
  }

  var selectedIndex = 1.obs;
  var previousIndex = 1.obs;

  void updateIndex(int index) {
    debugPrint("UPDATE INDEX OUTISDE $index ${selectedIndex.value}");
    if (selectedIndex.value != index) {
      debugPrint("UPDATE INDEX $index");
      previousIndex.value = selectedIndex.value;
      selectedIndex.value = index;
      debugPrint("UPDATE INDEX ${selectedIndex.value}");
    }
  }

  
  void switchToBusView(int index, int tab){
    updateIndex(0);
    final controller = Get.isRegistered<CoordinatorBusStatusController>()
        ? Get.find<CoordinatorBusStatusController>() // Find if already registered
        : Get.put(CoordinatorBusStatusController());

    controller.switchTab(tab);

  }

  void getLogin() async {
    loginType.value =
        await AppPreference.getStringFromSF(AppPreference.loginType) ?? "";
  }

  List<Widget> screens = [
    ProfileView(),
    BusStatusView(),
    SettingsView(),
  ];

  List<Widget> screensCoordinator = [
    CoordinatorBusStatusView(),
    CoordinatorProfileView(),
    CoordinatorSettingsView(),
  ];
}
