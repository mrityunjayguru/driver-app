
import 'package:get/get.dart';

class BottomBarController extends GetxController {

  var selectedIndex = 2.obs;
  var previousIndex = 2.obs;

  void updateIndex(int index) {
    if(index==2){



    }
    if(index==3){

    }
    if(index==4) {

    }
    previousIndex.value = selectedIndex.value;
    selectedIndex.value = index;
  }



/*  List<Widget> screens = [
    SettingView(),
    AlertView(),
    TrackRouteView(),
    VehicalesView(),
    ProfileView()
  ];*/
}
