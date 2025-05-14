
import 'package:get/get.dart';
import 'package:route_roster_pro/modules/guardian/view/bus_status_view.dart';
import 'package:route_roster_pro/modules/guardian/view/profile_view.dart';
import 'package:route_roster_pro/modules/guardian/view/settings_view.dart';

import '../../../utils/common_import.dart';

class BottomBarController extends GetxController {

  var selectedIndex = 1.obs;
  var previousIndex = 1.obs;

  void updateIndex(int index) {

    if(index==2){



    }
    previousIndex.value = selectedIndex.value;
    selectedIndex.value = index;
  }



  List<Widget> screens = [
    SettingsView(),
    BusStatusView(),
    ProfileView(),
  ];
}
